#!/bin/bash

clear

# Variables

VERSION="0.1.0"

LRED="\033[38;5;196m"
END="\e[0m"
LGREEN="\e[92m"
BLUE="\e[34m"
YELLOW="\e[93m"
BOLD="\e[1m"

BIASASCII=".______    __       ___           _______.
|   _  \  |  |     /   \         /       |
|  |_)  | |  |    /  ^  \       |   (----
|   _  <  |  |   /  /_\  \       \   \    
|  |_)  | |  |  /  _____  \  .----)   |   
|______/  |__| /__/     \__\ |_______/ "

echo "${BIASASCII}"
printf "BIAS v${VERSION} - Bias Isn't A Shell!\n"
echo "Type 'help' to see a list of commands."

printf "\n"

while true; do

        read -p ">: " userin

        case $userin in 
		# Help
		"help") printf "${LGREEN}System Commands:\n${END}"
		echo "  q, quit, exit, e 	  - Exit BIAS"
		echo "  c, cls, clr, clear	  - Clear screen"
		echo "  ver, version		  - Current version of BIAS"
		echo "  date, time 		  - Show date/time"
		echo "  qc 		          - Clear and exit"
		printf "${LGREEN}File Operations:\n${END}"
		echo "  f, files, dir		  - List files"
		echo "  rf                      - List root files"
		echo "  cf			  - Create file"
		echo "  p, cat, print		  - Read File"
                echo "  r, rm, d, delete        - Remove File"
		printf "${LGREEN}Tools:\n${END}"
		echo "  calc, biascalc	  - Calculator"
		echo "  weather		  - Show weather"
	        echo "  sys, biasfetch    	  - System information"	;;
                
		# Exit BIAS
                "q" | "quit" | "exit" | "e") echo "Exiting BIAS.."
		exit ;;
                
		# List files
                "f" | "files" | "dir" | "ls") ls ;;

		# List root files
                "rf") ls / ;;

		# Create files
                "cf") read -p "Name?: " nameoffile
		touch $nameoffile
		read -p "Text?: " text
		echo "$text" >> $nameoffile ;;
                 
		# Version 
                "ver" | "version") echo "BIAS v${VERSION}" ;;
                 
		# Clear screen
                "c" | "cls" | "clr" | "clear") clear ;;

		# Print files
                "p" | "cat" | "print" | "read") read -p "Print?: " printusertext
                if [ "$printusertext" = "" ]; then
			printf %b "${LRED}Unable to print: Nothing inputted.\n${END}"
		else
			printf "\n"
			cat $printusertext
			printf "\n"
		fi	;;

		# Calculator
	        "calc" | "biascalc") printf "${BOLD}BiasCalc v${VERSION}${END}\n"
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

		# Time/date
	        "date" | "time") date  ;;

		"biasascii") echo "${BIASASCII}"  ;;

		# Quit clear
		"qc") clear
		exit	;;
                
		# Remove file
		"r" | "rm" | "delete" | "d") read -p "Delete?: " delfile
		if [ "$delfile" = "" ]; then
			printf "${LRED}Unable to delete file: Nothing inputted.\n${END}"
		elif [ "$delfile" = "bias.sh" ]; then
			printf "${LRED}Unable to delete file: Deleting bias.sh will cause BIAS to be deleted.\n${END}"
		elif [ "$delfile" =  "/" ]; then
			printf "${LRED}Unable to delete file: Deleting root will cause everything in the system to be deleted.\n${END}"
		else
			rm $delfile
		fi ;;
                
		# Show weather
		"weather") printf "Cities with two or more words in their name need a '_' to seperate them.\n"
		read -p "City?: " weatherinput
		echo "Fetching from wttr.in.." 
		curl "http:/wttr.in/$weatherinput" ;;

                # Fetch system info
		"biasfetch" | "sys") printf "${BOLD}BiasFetch v${VERSION}${END}\n" 
		printf "${BIASASCII}\n"
		printf "${BLUE}BIAS Version:${END} ${VERSION}\n"
		printf "${BLUE}Operating System:${END} $(uname -o)\n"
		printf "${BLUE}Processor:${END} $(uname -p)\n"
		printf "${BLUE}Machine:${END} $(uname -m)\n"
		printf "${BLUE}Kernal:${END} $(uname -s)\n"
		printf "${BLUE}Kernal Version:${END} $(uname -r)\n" ;;

                *) echo "Unknown command: Not recognized by BIAS" ;;
        esac
done           
