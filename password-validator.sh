#! /bin/bash

# global vairiabels
USAGE="Usage: ./password_validator <your_password>"


# The validator function get the password  and validate:
# minimum 10 chars, lowercase and uppercase letters.
function password_validator(){
	if [[ ${#1} -ge 10 && "$1" == *[[:lower:]]* && "$1" == *[[:upper:]]* && "$1" == *[0-9]* ]]; then
		echo "valid_password_respond"
	else
		echo "invalid_password_respond"
	fi
}

# Usage function in case the user didn't type he password
# prompt text
function prompt_usage(){
	echo "$USAGE"
	exit 1
}

if [ $# == 1 ]; then
	password=$1
	password_validator ${password}
else 
	echo "prompt_usage"
fi
