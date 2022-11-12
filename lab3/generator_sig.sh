#!../../../bin/bash

pidParser=`cat ./pidParser.txt`

while true; do
	read LINE
	case "$LINE" in
		"+")
			kill -USR2 $pidParser
			;;
		"*")
			kill -USR1 $pidParser
			;;
		"TERM")
			kill $pidParser
			rm ./pidParser.txt
			exit
			;;
		*)
			:
			;;
	esac
done
