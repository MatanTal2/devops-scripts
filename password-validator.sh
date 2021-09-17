#! /bin/bash

# The validator function get the password  and validate:
# minimum 10 chars, lowercase and uppercase letters.
function password_validator(){
	echo "validator function"
}


if [ $# == 1 ]; then
	password=$1
	password_validator ${password}
else 
	echo "prompt_usage"
fi
