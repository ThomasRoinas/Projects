#! /bin/bash

#ThomasRoi

valid=true

while [[ epilogi -ne 5 || "$valid" == true ]];
do

	echo -e "\n"

	echo -e "Make a selection by typing the number between 1-5 according to your choice \n"

	echo "1. Δημιουργία ενός αρχείου με στοιχεία φοιτητών ενός πανεπιστημίου"
	echo "2. Προσθήκη νέου φοιτητή στο υπάρχον αρχείο"
	echo "3. Αναζήτηση φοιτητή με βάση τον αριθμό μητρώου του"
	echo "4. Προβολή στατιστικών στοιχείων"
	echo "5. Έξοδος"

	read epilogi


	epilogi1 () {

		echo "Give a name for the file."
		read filename

		if [[ -d $filename ]]; then

                         echo "Filename: $filename is a directory"

                          while [ -d $filename ]
                          do
                                  echo "Give a name for the file."
                                  read filename

                                  if  [[ -d $filename ]]; then
                                         echo "Filename: $filename is a directory"
 	                          fi
			done
		fi

		if [[ -f $filename ]]; then

			echo "Filename: $filename already exists"

			while [ -f $filename ]
			do
				echo "Give a name for the file."
				read filename

				if  [[ -f $filename ]]; then
					echo "Filename: $filename already exists"
				fi
			done
		fi

		touch $filename
		echo "The file: $filename has been created"

		echo "Amount of student entries: "
		read numans

		num=1

		while [ $num -le $numans ]
		do

			while true;
			do

				echo "Give the entry $num : kωδικός φοιτητή, επώνυμο, όνομα, αριθμός μητρώου, βαθμός επίδοσης, τμήμα"

				read entry


				kwdikos=$(echo "$entry" | awk -F',' '{print $1}')

				if echo "$kwdikos" | grep -qE '^[0-9]+$'; then ##########

					flag=true
				else
					echo "The student code given is not an integer"
				fi


				if [[ "$flag" == true ]]; then


					surname=$(echo "$entry" | awk -F',' '{print $2}')

					if echo "$surname" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "The surname of the student given is not a string"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					name=$(echo "$entry" | awk -F',' '{print $3}')

					if echo "$name" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "The name of the student given is not a string"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					am=$(echo "$entry" | awk -F',' '{print $4}')

					if echo "$am" | grep -qE '^[0-9]{6}$'; then

						flag=true
					else
						echo "The AM of the student given must be an integer and six letters long."
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					bathmos=$(echo "$entry" | awk -F',' '{print $5}')

					if echo "$bathmos" | grep -qE '^[0-9]+(\.[0-9])?$'; then

						flag=true
					else
						echo "The grade of the student given must be a of a decimal point 1"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					tmhma=$(echo "$entry" | awk -F',' '{print $6}')

					if echo "$tmhma" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "The school of the student is not a string"
						break
					fi

				fi

				if [[ "$flag" == true ]]; then

                			echo "$entry" >> "$filename"

					echo "Entry has been saved to file"

					num=$((num + 1))
					break
             	 		fi
			done
		done
	}


	epilogi2 () {

		echo "Give the filename for the file"
		read filename2

		if [[ -f $filename2 ]]; then

			n=1

			while [ $n -eq 1 ]
			do
				while true;
				do
					echo "Give an entry: kωδικός φοιτητή, επώνυμο, όνομα, αριθμός μητρώου, βαθμός επίδοσης, τμήμα"

					read entry


					kwdikos=$(echo "$entry" | awk -F',' '{print $1}')

					if echo "$kwdikos" | grep -qE '^[0-9]+$'; then ##########

						flag=true
					else
						echo "The student code given is not an integer"
					fi


					if [[ "$flag" == true ]]; then


						surname=$(echo "$entry" | awk -F',' '{print $2}')

						if echo "$surname" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "The surname of the student given is not a string"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						name=$(echo "$entry" | awk -F',' '{print $3}')

						if echo "$name" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "The name of the student given is not a string"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						am=$(echo "$entry" | awk -F',' '{print $4}')

						if echo "$am" | grep -qE '^[0-9]{6}$'; then

							flag=true
						else
							echo "The AM of the student given must be an integer and six letters long"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						bathmos=$(echo "$entry" | awk -F',' '{print $5}')

						if echo "$bathmos" | grep -qE '^[0-9]+(\.[0-9])?$'; then

							flag=true
						else
							echo "The grade of the student given must be of a decimal point 1"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						tmhma=$(echo "$entry" | awk -F',' '{print $6}')

						if echo "$tmhma" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "The school of the student given is not a string"
							break
						fi

					fi

					if [[ "$flag" == true ]]; then

                				echo "$entry" >> "$filename2"

						echo "Entry has been saved to file"

						n=$((n + 1))
						break
             	 			fi

				done

			done

		else
			echo "File doesn't exist"
		fi
	}


	epilogi3 () {

		echo "Give the file for searching the AM of a student"
		read filename3

		if [[ -f $filename3 ]]; then

			test=false

			while [ "$test" == false ]
			do

				echo "Give the AM to be searched"
				read AM

			if echo "$AM" | grep -qE '^[0-9]{6}$'; then

					test=true
				else
					test=false

					echo "The AM is not 6 characters long or contains characters outside of 0-9"
				fi

			done

			if [[ "$test" == true ]]; then

				found=$(grep -n -w "$AM" "$filename3")

				if [[ -n "$found" ]]; then

					echo "The AM is found"
					echo "$found" ###############
				else

					echo "The AM wasn't found in the file"

				fi
			fi

		else
			echo "To arxeio den uparxei"
		fi
	}



	epilogi4 () {

		echo "Give the file containing the entries of students"
		read filename4

		if [[ -f $filename4 ]]; then

			awk -F',' '{print $6}' $filename4 > test.txt

			awk  '{print $1}' "test.txt" | sort | uniq -c | awk  '{print $2 ":", $1}'

			rm test.txt

		else
			echo "The file given doesn't exist"
		fi
	}


	epilogi5 () {

		echo "Process Terminated"

		exit 0
	}



	if [[ $epilogi -eq 1 ]]; then

		epilogi1

	elif [[ $epilogi -eq 2 ]]; then

		epilogi2

	elif [[ $epilogi -eq 3 ]]; then

		epilogi3

	elif [[ $epilogi -eq 4 ]]; then

		epilogi4

	elif [[ $epilogi -eq 5 ]]; then

		epilogi5
	else
		echo "Choice must be a number between 1-5"
	fi
done
