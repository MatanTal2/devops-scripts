#! /bin/bash

# global vairiabels
USAGE="Usage: ./password_validator <your_password>"
red_color=`tput setaf 1`
green_color=`tput setaf 2`
reset_color=`tput sgr0`
NUMBER_OF_DIGITS=10

# The validator function get the password  and validate:
# minimum 10 chars, lowercase and uppercase letters.
function password_validator(){
	# security issue: password with - valid 
	if [[ ${#1} -ge 10 && "$1" == *[[:lower:]]* && "$1" == *[[:upper:]]* && "$1" == *[0-9]* ]]; then
		valid_password_respond
	else
		invalid_password_respond
	fi
}

# valid resppond
function valid_password_respond(){
	echo "${green_color}valid password${reset_color}"
	exit 0
}

# invalid respond - I decided to rechek the password for message error
function invalid_password_respond(){
	echo "${red_color}Invalid password${reset_color}"
	# check for number of digits
	if [[ ${#password} -lt ${NUMBER_OF_DIGITS} ]]; then
		echo "Must have 10 charactor"
	fi
	if [[ ${password} != *[[:lower:]]* ]]; then
		echo "Must have lowercase charactor"
	fi
	if [[ ${password} != *[[:upper:]]* ]]; then
		echo "Must have uppercase charactor"
	fi
	if [[ ${password} != *[0-9]* ]]; then
		echo "Must have digit"
	fi
	exit 1
}

# Usage function in case the user didn't type he password
# prompt text
function prompt_usage(){
	echo "$USAGE"
	exit 1
}

# main program

if [ $# == 1 ]; then
	password=$1
	password_validator ${password}
else 
	prompt_usage
fi
