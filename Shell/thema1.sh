#! /bin/bash

#Θέμα 1ο

#Βήμα 1

if [ $# -eq 0 ]; then      #Έλεγχος για το αν έχει δωθεί κάποιο όρισμα εισόδου από το χρήστη.

  	echo "No argument given. Please re-run the script providing an argument for the initial directory."
  	exit 0
fi

if [[ -d $1 ]]; then         #Έλεγχος για το αν υπάρχει κατάλογος με το όνομα που δώθηκε.

	echo "The directory: $1 already exists"
	echo "Initial Directory: $1"
	cd $1

	touch a.txt     #Δημιουργία 2 αρχείων στον αρχικό κατάλογο (για το βήμα 3).
	touch z.txt

elif [[ -f $1 ]]; then      #Έλεγχος για το αν υπάρχει αρχείο με το όνομα που δώθηκε.

	echo "The name given belongs to a file"
	echo "Please re-run the script providing a name which doesn't belong to a file."
	exit 0
else                                          #Περίπτωση που το όνομα που δώθηκε δεν αντιστοιχεί σε κάποιο αρχείο ή κατάλογο.
	echo "Directory: $1 doen't exist."    
	echo "Creating directory: $1 ..."
	echo "Initial Directory: $1"
	mkdir ~/$1     #############

 	cd $1
	touch a.txt       #Δημιουργία 2 αρχείων στον αρχικό κατάλογο (για το βήμα 3).
	touch z.txt

fi

#Βήμα 2

echo "Give a name for the first directory"
read dirname1

	if [[ -d $dirname1 ]]; then             #Έλεγχος για το αν υπάρχει ήδη το όνομα του πρώτου καταλόγου.	

		echo "The directory: $dirname1 already exists"
						
      						#Επανάληψη για το αν υπάρχει το όνομα του καταλόγου, όπου στη περίπτωση εύρεσής του να συνεχίζει				
      						#να ζητείται απο το χρήστη να εισάγει ένα νέο όνομα.
  		while [ -d $dirname1 ]          
		do
			echo "Give a name for the first directory"
			read dirname1

			if [[ -d $dirname1 ]]; then

				echo "The directory: $dirname1 already exists"
			fi
		done
	fi

echo "The directory: $dirname1 has been created under Directory: /$1"  #Εφόσον δεν βρέθηκε κατάλογος με το όνομα που δώθηκε, δημιουργείται ο καταλογος με το αντίστοιχο όνομα.
mkdir $dirname1


echo "Give a name for the second directory"
read dirname2

	if [[ -d $dirname2 ]]; then         #Έλεγχος για το αν υπάρχει ήδη το όνομα του δεύτερου καταλόγου.

		echo "The directory: $dirname2 already exists"

  						#Επανάληψη για το αν υπάρχει το όνομα του καταλόγου, όπου στη περίπτωση εύρεσής του να συνεχίζει				
      						#να ζητείται απο το χρήστη να εισάγει ένα νέο όνομα.
		while [ -d $dirname2 ]
		do
			echo "Give a name for the second directory"
			read dirname2

			if [[ -d $dirname2 ]]; then

				echo  "The directory: $dirname2 already exists"
			fi
		done
	fi

echo "The directory: $dirname2 has been created"    #Εφόσον δεν βρέθηκε κατάλογος με το όνομα που δώθηκε, δημιουργείται ο καταλογος με το αντίστοιχο όνομα.
mkdir $dirname2

#Βήμα 3

if [[ "(ls -A $1)" ]]; then     #Έλεγχος αν υπάρχουν αρχεία στον αρχικό κατάλογο.

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[A-La-l]*" -exec mv {} ~/Ergasies/$1/$dirname1/ \;   #Μεταφορά αρχείων με όνομα που ξεκινά από τα γράμματα A-L στον πρώτο κατάλογο.

	find ~/Ergasies/$1 -maxdepth 1 -type f -name "[M-Zm-z]*" -exec mv {} ~/Ergasies/$1/$dirname2/ \;   #Μεταφορά αρχείων με όνομα που ξεκινά από τα γράμματα Μ-Ζ στον δεύτερο κατάλογο.
else
	echo "The directory: $1 contains no files"   #Περίπτωση που δεν υπάρχουν αρχεία στον αρχικό κατάλογο.
fi

#Βήμα 4

if [[ $(ls -A "$dirname1") ]]; then   		#Έλεγχος αν υπάρχουν αρχεία στον πρώτο κατάλογο.

	if [[ $(ls -A "$dirname2") ]]; then   	  #Έλεγχος αν υπάρχουν αρχεία στον δεύτερο κατάλογο.

 		#Σειρά εντολών στην περίπτωση που και οι δύο κατάλογοι περιέχουν αρχεία.
   
		sum1=$(ls "$dirname1" | wc -l)    #Πλήθος αρχείων πρώτου καταλόγου.
		sum2=$(ls "$dirname2" | wc -l)    #Πλήθος αρχείων δεύτερου καταλόγου.

		sum=$((sum1 + sum2))     	  #Πλήθος αρχείων και απο τουσ δύο νέους καταλόγους,

		echo "$sum" > temp.txt   	  #Εγγραφή του πλήθους δε νέο αρχείο.

		echo "Number of files"
		cat temp.txt           		  #Εμφάνιση του πλήθους αρχείων μέσω εμφάνισης του περιεχομένου του νέου αρχείου.

		rm temp.txt           	          #Διαγραφή του νέου αρχείου, καθώς δεν χρησιμοποιείται έπειτα.

	else

		#Σειρά εντολών στην περίπτωση που ο πρώτος κατάλογος περιέχει αρχεία και ο δεύτερος είναι άδειος.

		echo "The second Directory: $dirname2 contains no files."

		sum1=$(ls "$dirname1" | wc -l)

		sum=$((sum1))                    #Το πλήθος των αρχείων αποτελείται απο τον αριθμό των αρχείων που περιέχονται στον πρώτο κατάλογο.

		echo "$sum" > temp.txt

		echo "Number of files: "
		cat temp.txt

		rm temp.txt
	fi
else

	#Σειρά εντολών στην περίπτωση που ο δεύτερος κατάλογος περιέχει αρχεία και ο πρώτος είναι άδειος.

	echo "The first Directory: $dirname1 contains no files."

	if [[ $(ls -A "$dirname2") ]]; then

                sum2=$(ls "$dirname2" | wc -l)

                sum=$((sum2))                 #Το πλήθος των αρχείων αποτελείται απο τον αριθμό των αρχείων που περιέχονται στον δεύτερο κατάλογο.

                echo "$sum" > temp.txt

		echo "Number of files: "
		cat temp.txt

		rm temp.txt

	else

 		#Σειρά εντολών στην περίπτωση που και οι δύο κατάλογοι δεν περιέχουν αρχεία.

		echo "First: $dirname1 and Second: $dirname2 Directories contain no files"
		echo "No transfers to be made ..."

		echo "Number of files: 0"
	fi
fi
