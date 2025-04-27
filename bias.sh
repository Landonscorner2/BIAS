#!/bin/bash

echo "BIAS - Bias Isn't A Shell!"

while true; do

        read -p ">: " userin

        case $userin in
                "help") echo "e - exit command line. f - lists home directory. rf - lists root directory. cf - creates text file with user inputted words. c - clears the screen. p - shows the contents of any text file the user inputs." ;;

                "e") exit ;;

                "f") ls ;;

                "rf") ls / ;;

                "cf") read -p "?: " nameoffile
		touch $nameoffile
		read -p "?: " text
		echo "$text" >> $nameoffile ;;

                "ver") echo "bias 0.0.2" ;;

                "c") clear ;;

                "p") read -p "?: " printusertext
                cat "$printusertext" ;;

	        "calc") read -p "Operator? (+, *): " operator
		case $operator in
			"+") read -p "Number?: " plusop1
			     read -p "Number?: " plusop2
			     x=$plusop1 y=$((x+plusop2))
			     echo $y ;;

			"*") read -p "Number?: " timesop1
			     read -p "Number?: " timesop2
		             x=$timesop1 y=$((x*timesop2))
			     echo $y  ;; 
		esac	;;

                *) echo "Unknown Command.";;
        esac
done           
