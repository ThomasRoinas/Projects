#! /bin/bash  

#Askhsh 1 - Lab3/lab4.pdf

if [[ $# -eq 2 ]]; then  	

	echo "Directory: $1, file extension: $2"
	
	if [[ -d $1 ]];
	then 
		echo "The filename is a directory."
		echo "Files with $2 extension: "
		find "$1" -type f -name "*.$2"
	elif [[ -f $1 ]];
	then
		echo "The fileame is a file, not a directory."
	else
		echo "The filename is not a directory or a file."
	fi

elif [[ $# -eq 1 ]]; then
	echo "Haven't added a filename or a file extension."

else
	echo "Not enough or too meny arguments."
fi




