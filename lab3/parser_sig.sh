#!../../../bin/bash

echo "$$" > ./pidParser.txt

cur=1
mode="PLUS"
usr1() 
{
	mode="MUL"
}

usr2()
{
	mode="PLUS"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'echo "Calculation terminated!"; exit' SIGTERM
while true; do
	case "$mode" in
		"PLUS")
			let cur=$cur+2
			;;
		"MUL")
			let cur=$cur*2
			;;
	esac
	echo "Current value is: $cur"
	sleep 1
done


