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
			"-")
				mode="MINUS"
				;;
			"/")
				mode="DIV"
				;;
			*)
				if ! [[ $LINE =~ ^[0-9]+(.[0-9]+)?$ ]]; then
					echo "Error, invalid input parameter! Please enter mode (+ or *), number or QUIT to stop calculating ";
				else
					if [[ "$mode" == "DIV" && $LINE =~ ^0(.0+)?$ ]]; then
						echo "Error, you tried to divide by zero!";
					else
						case "$mode" in
							"PLUS")
								res=$(awk "BEGIN {print $res+$LINE}")
								;;
							"MUL")
								res=$(awk "BEGIN {print $res*$LINE}")
								;;
							"MINUS")
								res=$(awk "BEGIN {print $res-$LINE}")
								;;
							"DIV")
								res=$(awk "BEGIN {print $res/$LINE}")
								#awk 'BEGIN { x='$res'; y='$LINE'; print x, y; r = x/y ;} ; END {}'
								;;
						esac
						echo "Result is: $res"
					fi
				fi
				;;
		esac
	done

rm ./genPID.txt
