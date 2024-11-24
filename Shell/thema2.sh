#! /bin/bash

valid=true

while [[ $epilogi -ne 5 || "$valid" == true ]];
do

	echo -e "\n"

	echo "Epilekste mia epilogi"

	echo "1. Δημιουργία ενός αρχείου με στοιχεία φοιτητών ενός πανεπιστημίου"
	echo "2. Προσθήκη νέου φοιτητή στο υπάρχον αρχείο"
	echo "3. Αναζήτηση φοιτητή με βάση τον αριθμό μητρώου του"
	echo "4. Προβολή στατιστικών στοιχείων"
	echo "5. Έξοδος"

	read epilogi

	epilogi1 () {

		echo "Dwse to onoma tou arxeiou"
		read filename

		if [[ -f $filename ]]; then

			echo "The file: $filename exists"

			while [ -f $filename ]
			do
				echo "Dwse to onoma tou arxeiou"
				read filename

				echo "The file: $filename exists"
			done
		fi

		echo "The file: $filename created"
		touch $filename

		echo "Poses eggrafes thelete na ginoun"
		read numans

		num=1

		while [ $num -le $numans ]
		do

			while true;
			do

				echo "Dwse egrafh: kωδικός φοιτητή, επώνυμο, όνομα, αριθμός μητρώου, βαθμός επίδοσης, τμήμα"

				read entry


				kwdikos=$(echo "$entry" | awk -F',' '{print $1}')

				if echo "$kwdikos" | grep -qE '^[0-9]+$'; then ##########

					flag=true
				else
					echo "The code is not an integer"
				fi


				if [[ "$flag" == true ]]; then


					surname=$(echo "$entry" | awk -F',' '{print $2}')

					if echo "$surname" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "The surname is not a string"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					name=$(echo "$entry" | awk -F',' '{print $3}')

					if echo "$name" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "The name is not a string"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					am=$(echo "$entry" | awk -F',' '{print $4}')

					if echo "$am" | grep -qE '^[0-9]{6}$'; then

						flag=true
					else
						echo "The am is not int or 6"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					bathmos=$(echo "$entry" | awk -F',' '{print $5}')

					if echo "$bathmos" | grep -qE '^[0-9]+(\.[0-9])?$'; then

						flag=true
					else
						echo "Bathmos is not .dekadikos"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then

					tmhma=$(echo "$entry" | awk -F',' '{print $6}')

					if echo "$tmhma" | grep -qE '[A-Za-z][A-Za-z]*'; then

						flag=true
					else
						echo "Tmhma not a string"
						break
					fi

				fi

				if [[ "$flag" == true ]]; then

                			echo "$entry" >> "$filename"

					echo "Egine eggrafh sto arxeio" 

					num=$((num + 1))
					break
             	 		fi
			done
		done
	}



	epilogi2 () {

		echo "Dwse to onoma arxeiou gia thn eggrafh"
		read filename2

		if [[ -f $filename2 ]]; then

			n=1

			while [ $n -eq 1 ]
			do
				while true;
				do
					echo "Dwse egrafh: kωδικός φοιτητή, επώνυμο, όνομα, αριθμός μητρώου, βαθμός επίδοσης, τμήμα"

					read entry


					kwdikos=$(echo "$entry" | awk -F',' '{print $1}')

					if echo "$kwdikos" | grep -qE '^[0-9]+$'; then ##########

						flag=true
					else
						echo "The code is not an integer"
					fi


					if [[ "$flag" == true ]]; then


						surname=$(echo "$entry" | awk -F',' '{print $2}')

						if echo "$surname" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "The surname is not a string"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						name=$(echo "$entry" | awk -F',' '{print $3}')

						if echo "$name" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "The name is not a string"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						am=$(echo "$entry" | awk -F',' '{print $4}')

						if echo "$am" | grep -qE '^[0-9]{6}$'; then

							flag=true
						else
							echo "The am is not int or 6"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						bathmos=$(echo "$entry" | awk -F',' '{print $5}')

						if echo "$bathmos" | grep -qE '^[0-9]+(\.[0-9])?$'; then

							flag=true
						else
							echo "Bathmos is not .dekadikos"
							break
						fi
					fi

					if [[ "$flag" == true ]]; then

						tmhma=$(echo "$entry" | awk -F',' '{print $6}')

						if echo "$tmhma" | grep -qE '[A-Za-z][A-Za-z]*'; then

							flag=true
						else
							echo "Tmhma not a string"
							break
						fi

					fi

					if [[ "$flag" == true ]]; then

                				echo "$entry" >> "$filename2"

						echo "Egine eggrafh sto arxeio"

						n=$((n + 1))
						break
             	 			fi

				done

			done

		else
			echo "To arxeio den uparxei"
		fi
	}



	epilogi3 () {

		echo "Dwse to arxeio gia thn anazhthsh"
		read filename3

		if [[ -f $filename3 ]]; then

			test=false

			while [ "$test" == false ]
			do

				echo "Dwse to AM"
				read AM

			if echo "$AM" | grep -qE '^[0-9]{6}$'; then

					test=true
				else
					test=false

					echo "AM oxi 6 or 0-9"
				fi

			done

			if [[ "$test" == true ]]; then

				found=$(grep -n -w "$AM" "$filename3")

				if [[ -n "$found" ]]; then

					echo "AM uparxei"
					echo "$found" ###############
				else

					echo "To AM den uparxei"

				fi

			fi

		else
			echo "To arxeio den uparxei"
		fi
	}






	epilogi4 () {

		echo "Dwse to arxeio"
		read filename4

		if [[ -f $filename4 ]]; then

			echo "COMPUTER_SCIENCE: $(grep -w "COMPUTER_SCIENCE" "$filename4" | wc -l)"
			echo "ECONOMICS: $(grep -w "ECONOMICS" "$filename4" | wc -l)"
			echo "PRIMARY_EDUCATION: $(grep -w "PRIMARY_EDUCATION" "$filename4" | wc -l)"
			echo "ART: $(grep -w "ART" "$filename4" | wc -l)"

		else
			echo "File doesn't exist"
		fi
	}



	epilogi () {

		echo "Termatismos diadikasias"

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
	fi
done
