#! /bin/bash

echo "Directory: $1"

if [[ -d $1 ]]; then

	echo "Directory: $1 exists"

elif [[ -f $1 ]]; then

	echo "The name given is a file."
else
	echo "Directory: $1 doen't exists."
	echo "Creating directory: $1"
	mkdir ~/Ergasies/$1

	cd $1
	touch a.txt
	touch z.txt
fi

echo "Give a name for the first directory"
read dirname1

if [[ -d $dirname1 ]]; then

	echo "The directory: $dirname1 exists"

else
	echo "The directory: $dirname1 created"
	mkdir $dirname1
fi

echo "Give a name for the second directory"
read dirname2

if [[ -d $dirname2 ]]; then

	echo "The directory: $dirname2 exists"
else
	echo "The directory: $dirname2 created"
	mkdir $dirname2
fi


if [[ "(ls -A $1)" ]]; then

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[A-La-l]*" -exec mv {} ~/Ergasies/$1/$dirname1/ \;

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[M-Zm-z]*" -exec mv {} ~/Ergasies/$1/$dirname2/ \;
else
	echo "The directory: $1 is empty"
fi


sum1=$(ls "$dirname1" | wc -l)
sum2=$(ls "$dirname2" | wc -l)

sum=$((sum1 + sum2))

echo "$sum" > temp.txt
