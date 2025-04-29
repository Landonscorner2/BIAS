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
                "help") echo "q - Exit BIAS"
		        echo "f - List files"
			echo "rf - List root files"
			echo "cf - Create file (with text)"
			echo "ver - Current version of BIAS"
			echo "c - Clear screen"
			echo "p - Show words on a file"
			echo "calc - Built-in calculator"
			echo "cal - Calender for current year"
			echo "qc - Exit BIAS and clear screen"	;;

                "q") exit ;;

                "f") ls ;;

                "rf") ls / ;;

                "cf") read -p "?: " nameoffile
		touch $nameoffile
		read -p "?: " text
		echo "$text" >> $nameoffile ;;

                "ver") echo "BIAS 0.0.3" ;;

                "c") clear ;;

                "p") read -p "Print?: " printusertext
                cat "$printusertext" ;;

	        "calc") echo "BiasCalc 0.0.3"
		printf "\n"
		read -p "Operator? (+, *, -): " operator	
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
		             read -p "Numner?: " minusop2
		             x=$minusop1 y=$((x-minusop2))
			     echo $y  ;;

		        *)   echo "Operator not found." ;;

		esac	;;

	        "cal") cal -y ;;

		"biasascii") echo ".______    __       ___           _______.
|   _  \  |  |     /   \         /       |
|  |_)  | |  |    /  ^  \       |   (----
|   _  <  |  |   /  /_\  \       \   \    
|  |_)  | |  |  /  _____  \  .----)   |   
|______/  |__| /__/     \__\ |_______/"  ;;

		"qc") clear
		exit	;;

                *) echo "Unknown Command.";;
        esac
done           
