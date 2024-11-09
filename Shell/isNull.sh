#! /bin/bash

if [[ $# -eq 1 ]];
then
	echo "Directory: $1."

	if [[ -d $1 ]];
	then
		echo "The directory $1 exists."
		if [[ "$(ls -A $1)" ]]; 
		then
			echo "The directory contains $(ls $1 | wc -l) files."
			echo "The files: $(ls $1)"
		else
			echo "The directory is empty."
		fi
	else
		echo "The directory doesn't exist."
	fi
else
	echo "Too many or not enough arguments."
fi
