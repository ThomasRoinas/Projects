#! /bin/bash

# Thomas Roi

if [ $# -eq 0 ]; then

  	echo "No argument given. Please re-run the script providing an argument for the initial directory."
  	exit 0
fi

if [[ -d $1 ]]; then

	echo "The directory: $1 already exists"
	echo "Initial Directory: $1"
	cd $1
	touch a.txt
	touch b.txt

elif [[ -f $1 ]]; then

	echo "The name given belongs to a file"
	echo "Please re-run the script providing a name which doesn't belong to a file."
	exit 0
else
	echo "Directory: $1 doen't exist."
	echo "Creating directory: $1 ..."
	echo "Initial Directory: $1"
	mkdir ~/Ergasies/$1

	cd $1
	#touch a.txt
	#touch z.txt

fi

echo "Give a name for the first directory"
read dirname1

	if [[ -d $dirname1 ]]; then

		echo "The directory: $dirname1 already exists"

		while [ -d $dirname1 ]
		do
			echo "Give a name for the first directory"
			read dirname1

			echo "The directory: $dirname1 already exists"
		done
	fi

echo "The directory: $dirname1 has been created under Directory: /$1"
mkdir $dirname1


echo "Give a name for the second directory"
read dirname2

	if [[ -d $dirname2 ]]; then

		echo "The directory: $dirname2 already exists"

		while [ -d $dirname2 ]
		do
			echo "Give a name for the second directory"
			read dirname2

			echo  "The directory: $dirname2 already exists"
		done
	fi

echo "The directory: $dirname2 has been created"
mkdir $dirname2


if [[ "(ls -A $1)" ]]; then

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[A-La-l]*" -exec mv {} ~/Ergasies/$1/$dirname1/ \;

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[M-Zm-z]*" -exec mv {} ~/Ergasies/$1/$dirname2/ \;
else
	echo "The directory: $1 contains no files"
fi


if [[ $(ls -A "$dirname1") ]]; then

	if [[ $(ls -A "$dirname2") ]]; then

		sum1=$(ls "$dirname1" | wc -l)
		sum2=$(ls "$dirname2" | wc -l)

		sum=$((sum1 + sum2))

		echo "$sum" > temp.txt

		echo "Number of files"
		cat temp.txt

	else

		echo "The second Directory: $dirname2 contains no files."

		sum1=$(ls "$dirname1" | wc -l)

		sum=$((sum1))

		echo "$sum" > temp.txt

		echo "Number of files: "
		cat temp.txt
	fi
else

	echo "The first Directory: $dirname1 contains no files."

	if [[ $(ls -A "$dirname2") ]]; then

                sum2=$(ls "$dirname2" | wc -l)

                sum=$((sum2))

                echo "$sum" > temp.txt

		echo "Number of files: "
		cat temp.txt

	else

		echo "First: $dirname1 and Second: $dirname2 Directories contain no files"
		echo "No transfers to be made ..."

		echo "Number of files: 0"
	fi
fi
