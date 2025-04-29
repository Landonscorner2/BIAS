#!/bin/bash

clear

echo ".______    __       ___           _______.
|   _  \  |  |     /   \         /       |
|  |_)  | |  |    /  ^  \       |   (----
|   _  <  |  |   /  /_\  \       \   \    
|  |_)  | |  |  /  _____  \  .----)   |   
|______/  |__| /__/     \__\ |_______/ "

echo "BIAS - Bias Isn't A Shell!"

printf "\n"

while true; do

        read -p ">: " userin

        case $userin in
                "help") echo "q, quit, exit, e - Exit BIAS"
		        echo "f, files, dir - List files"
			echo "rf - List root files"
			echo "cf - Create file (with text)"
			echo "ver, version - Current version of BIAS"
			echo "c, cls, clr, clear - Clear screen"
			echo "p, cat, print, read - Show words on a file"
			echo "calc, biascalc, calculator - Built-in calculator"
			echo "date, time - Show time and date"
			echo "qc - Exit BIAS and clear screen"
			echo "r, rm, delete, d - Remove file"	;;

                "q" | "quit" | "exit" | "e") exit ;;

                "f" | "files" | "dir") ls ;;

                "rf") ls / ;;

                "cf") read -p "Name?: " nameoffile
		touch $nameoffile
		read -p "Text?: " text
		echo "$text" >> $nameoffile ;;

                "ver" | "version") echo "BIAS 0.0.4" ;;

                "c" | "cls" | "clr" | "clear") clear ;;

                "p" | "cat" | "print" | "read") read -p "Print?: " printusertext
                if [ "$printusertext" = "" ]; then
			echo "Unable to print: Nothing inputted."
		else
			printf "\n"
			cat $printusertext
			printf "\n"
		fi	;;

	        "calc" | "biascalc" | "calculator") echo "BiasCalc 0.0.4"
		printf "\n"
		read -p "Operator? (+, *, -, /): " operator	
		case $operator in
			"+") read -p "Number?: " plusop1
			     read -p "Number?: " plusop2
			     x=$plusop1 y=$((x+plusop2))
			     echo $y ;;

			"*") read -p "Number?: " timesop1
			     read -p "Number?: " timesop2
		             x=$timesop1 y=$((x*timesop2))
			     echo $y  ;;

		        "-") read -p "Number?: " minusop1
		             read -p "Number?: " minusop2
		             x=$minusop1 y=$((x-minusop2))
			     echo $y  ;;

			"/") read -p "Number?: " divideop1
			     read -p "Number?: " divideop2
			     x=$divideop1 y=$((x/divideop2))
		             echo $y  ;;

		        *)   echo "Operator not found." ;;

		esac	;;

	        "date" | "time") date  ;;

		"biasascii") echo ".______    __       ___           _______.
|   _  \  |  |     /   \         /       |
|  |_)  | |  |    /  ^  \       |   (----
|   _  <  |  |   /  /_\  \       \   \    
|  |_)  | |  |  /  _____  \  .----)   |   
|______/  |__| /__/     \__\ |_______/"  ;;

		"qc") clear
		exit	;;

		"r" | "rm" | "delete" | "d") read -p "Delete?: " delfile
		if [ "$delfile" = "" ]; then
			echo "Unable to delete file: Nothing inputted."
		elif [ "$delfile" = "bias.sh" ]; then
			echo "Unable to delete file: Deleting bias.sh will cause BIAS to be deleted."
		else
			rm $delfile
		fi ;;



                *) echo "Unknown Command." ;;
        esac
done           
