#! /bin/bash

#Θέμα 2

while [[ epilogi -ne 5 ]];      #Επανάληψη ώστε να εμφανίζεται το μενού επιλογών μετά την ολοκλήρωαση μι ενέργειας από το μενού.
do

	echo -e "\n"

	echo -e "Make a selection by typing the number between 1-5 according to your choice \n"    #Εμφάνιση του μενού επιλογών.

	echo "1. Δημιουργία ενός αρχείου με στοιχεία φοιτητών ενός πανεπιστημίου"
	echo "2. Προσθήκη νέου φοιτητή στο υπάρχον αρχείο"
	echo "3. Αναζήτηση φοιτητή με βάση τον αριθμό μητρώου του"
	echo "4. Προβολή στατιστικών στοιχείων"
	echo "5. Έξοδος"

	read epilogi


	epilogi1 () {        #Συνάρτηση για την 1η επιλογή του μενού.

		echo "Give a name for the file."
		read filename

		if [[ -d $filename ]]; then                 #Έλεγχος για το αν το όνομα του αρχείου που δώθηκε υπάρχει ήδη ως κατάλογος.

                         echo "Filename: $filename is a directory"        

                          while [ -d $filename ]             #Επανάληψη στην περίπτωση που δίνεται όνομα αρχείου που αντιστοιχεί σε κατάλογο.
                          do
                                  echo "Give a name for the file."
                                  read filename

                                  if  [[ -d $filename ]]; then
                                         echo "Filename: $filename is a directory"
 	                          fi
			done                                #Επανάληψη τελειώνει όταν δωθεί όνομα αρχείου που δεν αντιστοιχεί σε κατάλογο.
		fi

		if [[ -f $filename ]]; then                 #Έλεγχος για το αν το όνομα του αρχείου που δώθηκε υπάρχει ήδη ως αρχείο.

			echo "Filename: $filename already exists"

			while [ -f $filename ]             #Επανάληψη στην περίπτωση που δίνεται όνομα αρχείου που αντιστοιχεί σε ήδη υπάρχοντα αρχείο.
			do
				echo "Give a name for the file."   
				read filename              

				if  [[ -f $filename ]]; then
					echo "Filename: $filename already exists"
				fi
			done                               #Επανάληψη τελειώνει όταν δωθεί όνομα αρχείου που δεν αντιστοιχεί σε ήδη υπάρχοντα αρχείο.
		fi

		touch $filename                            #Δημιουργείται αρχείο με το όνομα που δώθηκε από τον χρήστη.
		echo "The file: $filename has been created"

		echo "Amount of student entries: "         #Ζητείται από το χρήστη να εισάγει τον αριθμό των εγγραφών που θέλει αν γίνουν στο αρχείο. 
		read numans

		num=1                #Μετρητής για την επανάληψη της διαδικασίας εισαγωγής εγγραφών για όσες φορές έχει δηλώσει ο χρήστης.

		while [ $num -le $numans ]       #Επανάληψη που συνεχίζει μέχρι ο μετρητής να περάσει τον αριθμό των εγγραφών που δώθηκε από το χρήστη.
		do

			while true;              #Επανάληψη για τη συνεχόμενη εκτέλεση της διαδικασίας εγγραφής ενός φοιτητή. Η επανάληψη θα σταματάει σε λανθασμένη εισαγωγή ενός πεδίου με την εντολή break.
			do

				echo "Give the entry $num : kωδικός φοιτητή,επώνυμο,όνομα,αριθμός μητρώου,βαθμός επίδοσης,τμήμα"

				read entry


				kwdikos=$(echo "$entry" | awk -F',' '{print $1}')         #Κωδικός φοιτήτή αποτελεί το πρώτο πεδίο της εγγραφής.

				if echo "$kwdikos" | grep -qE '^[0-9]+$'; then            #Έλεγχος για την εγκυρότητα του πεδίου "κωδικός φοιτητή" (ακέραιες τιμές).

					flag=true					  #flag που παίρνει την τιμή true κατά την ορθή καταγραφή των πεδίων.
				else
					echo "The student code given is not an integer"
				fi


				if [[ "$flag" == true ]]; then				  #Όταν το flag είναι true τότε παιρνάμε στο επόμενο πεδίο της εγγραφής.

					surname=$(echo "$entry" | awk -F',' '{print $2}')       #Επώνυμο αποτελεί το δεύτερο πεδίο της εγγραφής.

					if echo "$surname" | grep -qE '[A-Za-z][A-Za-z]*'; then    #Έλεγχος για την εγκυρότητα του πεδίου "επώνυμο" (συμβολοσειρά).

						flag=true
					else                                                       #Περίπτωση λανθασμένης εισαγωγής του πεδίου "επώνυμο".						echo "The surname of the student given is not a string"
						break        #Εντολή break ώστε να σταματήσει η επανάλψη (while true;) και να ξεκινήσει μία νέα εγγραφή.
					fi
				fi

				if [[ "$flag" == true ]]; then                      #Όταν το flag είναι true τότε παιρνάμε στο επόμενο πεδίο της εγγραφής.

					name=$(echo "$entry" | awk -F',' '{print $3}')     #Όνομα αποτελεί το τρίτο πεδίο της εγγραφής.

					if echo "$name" | grep -qE '[A-Za-z][A-Za-z]*'; then   #Έλεγχος για την εγκυρότητα του πεδίου "όνομα" (συμβολοσειρά).

						flag=true
					else
						echo "The name of the student given is not a string"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then                     #Όταν το flag είναι true τότε παιρνάμε στο επόμενο πεδίο της εγγραφής.

					am=$(echo "$entry" | awk -F',' '{print $4}')            #αριθμός μητρώου αποτελεί το τέταρτο πεδίο της εγγραφής.

					if echo "$am" | grep -qE '^[0-9]{6}$'; then          #Έλεγχος για την εγκυρότητα του πεδίου "αριθμός μητρώου" (ακέραιες τιμές με μήκος έξι χαρακτήρες).

						flag=true
					else
						echo "The AM of the student given must be an integer and six letters long."
						break
					fi
				fi

				if [[ "$flag" == true ]]; then                     #Όταν το flag είναι true τότε παιρνάμε στο επόμενο πεδίο της εγγραφής.

					bathmos=$(echo "$entry" | awk -F',' '{print $5}')        #βαθμός επίδοσης αποτελεί το πέμπτο πεδίο της εγγραφής.

					if echo "$bathmos" | grep -qE '^[0-9]+(\.[0-9])?$'; then   #Έλεγχος για την εγκυρότητα του πεδίου "βαθμός επίδοσης" (τιμές με υποδιαστολή με ακρίβεια ενός δεκαδικού ψηφίου).

						flag=true
					else
						echo "The grade of the student given must be a of a decimal point 1"
						break
					fi
				fi

				if [[ "$flag" == true ]]; then                   #Όταν το flag είναι true τότε παιρνάμε στο επόμενο πεδίο της εγγραφής.

					tmhma=$(echo "$entry" | awk -F',' '{print $6}')         #τμήμα αποτελεί το έκτο πεδίο της εγγραφής.

					if echo "$tmhma" | grep -qE '[A-Za-z][A-Za-z]*'; then   #Έλεγχος για την εγκυρότητα του πεδίου "τμήμα" (συμβολοσειρές).

						flag=true
					else
						echo "The school of the student is not a string"
						break
					fi

				fi

				if [[ "$flag" == true ]]; then               #Όταν το flag είναι true από τον έλεγχο όλων των πεδίων τότε η εγγραφή αποθηκεύται στο αρχείο που έχει οριστεί στο 1ο βήμα.

                			echo "$entry" >> "$filename"         #Η εγγραφή, εγγράφεται στο αρχείο που έχει οριστεί.

					echo "Entry has been saved to file"

					num=$((num + 1))       #Αύξηση του μετρητή κατά 1 εφόσον έχει ολοκληρωθεί μία εγγραφή.
					break         #Σταματάει η επανάληψη "while true;" ώστε να γίνει έλεγχος στην επανάληψη "while [ $num -le $numans ]".
             	 		fi
			done
		done
	}


	epilogi2 () {             #Συνάρτηση για την 2η επιλογή του μενού.

		echo "Give the filename for the file"     #Στην 2η συνάρτηση ακολουθείται η ίδια διαδικασία εισαγωγής εγγραφών με τον ίδιο κώδικα από την 1η συνάρτηση.
		read filename2                            #Η μόνη διαφορά είναι ότι υπάρχει ένας ακόμα έλεγχος για το αν υπάρχει το αρχείο που εισάγει ο χρήστης για την εγγραφή. 

		if [[ -f $filename2 ]]; then    #Έλεγχος αν υπάρχει το αρχείο που έχει εισάγει ο χρήστης.

			n=1   

			while [ $n -eq 1 ]      #Η επανάληψη θα γίνεται μία φορά, όσο ο μετρητής "n" έχει την τιμή 1 (Θέλουμε να γίνει μία εγγραφή).
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

						n=$((n + 1))     #Ο μετρητής αυξάνεται κατά 1 ώστε να μην γίνει άλλη επανάληψη της διαδικασίας.
						break
             	 			fi

				done

			done

		else                                             #Περίπτωση που το αρχείο που δόθηκε από το χρήστη δεν υπάρχει.
			echo "File doesn't exist"
		fi
	}


	epilogi3 () {     #Συνάρτηση για την 3η επιλογή του μενού.

		echo "Give the file for searching the AM of a student"     #Ζητείται από το χρήστη το όνομα του αρχείου προς αναζήτηση του αριθμού μητρώου ενός φοιτητή.
		read filename3

		if [[ -f $filename3 ]]; then        #Έλεγχος για το αν υπάρχει αρχείο με το όνομα που έδωσε ο χρήστης.

			test=false                  #Περίπτωση που το αρχείο με το όνομα που δόθηκε απο το χρήστη υπάρχει. test=false για να ξεκινήσει έστω μία φορά η επανάληψη.

			while [ "$test" == false ]    #Επανάληψη όσο το "test" έχει την τιμή false ώστε να επαναλαμβάνεται το μήνυμα "Give the AM to be searched" και να ελέγχεται η εγκυρότητα του  αριθμού μητρώου που δώθηκε από το χρήστη.
			do                            #Επανάληψη σταματάει όταν ο αριθμός μητρώου που δοθεί είναι έγκυρος, άρα και το "test" παίρνει την τιμή true.

				echo "Give the AM to be searched"
				read AM

				if echo "$AM" | grep -qE '^[0-9]{6}$'; then    #Έλεγχος για την εγκυρότητα του αριθμού μητρώου (ακέραιες τιμές με μήκος έξι χαρακτήρες) που δώθηκε από το χρήστη.

					test=true
				else                        #Περίπτωση που ο αριθμός μητρώου που δόθηκε δεν είναι έγκυρος.
					test=false

					echo "The AM is not 6 characters long or contains characters outside of 0-9"
				fi

			done

			if [[ "$test" == true ]]; then      #Έλεγχος για το αν ο αριθμός μητρώου που δόθηκε είναι έγκυρος (test=true).

				found=$(grep -n -w "$AM" "$filename3")    #Αναζήτηση του αριθμού μητρώου στο αρχείο.

				if [[ -n "$found" ]]; then       #Έλεγχος για αν το "found" είναι κενό, δηλαδλή έχει μήκος συμβολοσειράς μεγαλύτερο του 0. 
                                                                 #Περίπτωση όπου το "found" δεν είναι κενό, δηλαδή ο αριθμός μητρώου έχει βρεθεί στο αρχείο.
					echo "The AM is found"
					echo "$found"
				else                            #Περίπτωση όπου το "found" είναι κενό, δηλαδή ο αριθμός μητρώου δεν έχει βρεθεί στο αρχείο.

					echo "The AM wasn't found in the file"

				fi
			fi

		else                                             #Περίπτωση που το αρχείο με το όνομα που δόθηκε απο το χρήστη δεν υπάρχει.
			echo "To arxeio den uparxei"
		fi
	}



	epilogi4 () {      #Συνάρτηση για την 4η επιλογή του μενού.

		echo "Give the file containing the entries of students"     #Ζητείται από το χρήστη το όνομα του αρχείου που περιέχονται οι εγγραφές των στοιχείων των φοιτητών.
		read filename4

		if [[ -f $filename4 ]]; then      #Έλεγχος για αν το όνομα του αρχείου που δόθηκε από το χρήστη υπάρχει.

			awk -F',' '{print $6}' $filename4 > test.txt    #Το πεδίο που (6) που αντιστιχεί στο τμήμα του (κάθε) φοιτητή εγγράφεται σε ένα νέο αρχείο "test.txt".

			awk  '{print $1}' "test.txt" | sort | uniq -c | awk  '{print $2 ":", $1}'  #Στο πρώτο πεδίο (τμήμα) του νέου αρχείου "test.txt" γίνεται ταξιμόμηση (αλφαβητικά) των τμημάτων 
                                                                                                   #και μετράται η παρουσία κάθε τμήματος εμφανίζοντας το τμήμα και δίπλα τον αριθμό παρουσίας του αντίστοιχου τμήματος.
			rm test.txt   #Διαγράφεται το αρχείο εφόσον δεν θα χρησιμοποιηθεί έπειτα.

		else                                              #Περίπτωση που το όνομα του αρχείου που δόθηκε από το χρήστη δεν υπάρχει.
			echo "The file given doesn't exist"
		fi
	}


	epilogi5 () {    #Συνάρτηση για την 5η επιλογή του μενού.

		echo "Process Terminated"    #Εμφάνιση μηνύματος για το τέλος της διαδικασίας.

		exit 0      #Τερματίζεται η διαδικασία.
	}


#Κλήση των συναρτήσεων ανάλογα την αντίστοιχη επιλογή του χρήστη.

	if [[ $epilogi -eq 1 ]]; then         #Περίπτωση που η επιλογή του χρήστη έχει τη τιμη 1 (για τη επιλογή 1 του μενού).

		epilogi1

	elif [[ $epilogi -eq 2 ]]; then       #Περίπτωση που η επιλογή του χρήστη έχει τη τιμη 2 (για τη επιλογή 2 του μενού).

		epilogi2

	elif [[ $epilogi -eq 3 ]]; then       #Περίπτωση που η επιλογή του χρήστη έχει τη τιμη 3 (για τη επιλογή 3 του μενού).

		epilogi3

	elif [[ $epilogi -eq 4 ]]; then       #Περίπτωση που η επιλογή του χρήστη έχει τη τιμη 4 (για τη επιλογή 4 του μενού).

		epilogi4

	elif [[ $epilogi -eq 5 ]]; then       #Περίπτωση που η επιλογή του χρήστη έχει τη τιμη 5 (για τη επιλογή 5 του μενού).

		epilogi5
	else
		echo "Choice must be a number between 1-5"
	fi
done
