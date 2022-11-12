#!../../../bin/bash

mkfifo pipe

mode="PLUS"
res=1

( tail -f pipe ) | 
	while true; do
		read LINE
		case "$LINE" in
			"QUIT")
				echo "Cancel calculations"
				killall tail
				rm pipe
				echo "Stopping generator"
				genPID=`cat ./genPID.txt`
				kill $genPID
				exit
				;;
			"+")
				mode="PLUS"
				;;
			"*")
				mode="MUL"
				;;
			*)
				if ! [[ $LINE =~ ^[0-9]+$ ]]; then
					echo "Error, invalid input parameter! Please enter mode (+ or *), number or QUIT to stop calculating ";
				else
					if [[ "$mode" = "PLUS" ]]; then
						let res=$res+$LINE;
					else
						let res=$res*$LINE;
					fi
					echo "Result is: $res"
				fi
				;;
		esac
	done

rm ./genPID.txt
