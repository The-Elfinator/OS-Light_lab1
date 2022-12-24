#!../../bin/bash

n=$1
step=0
while true; 
do
	arr+=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  
	let step=$step+1
	let length=$step*10
	if [[ $length -ge $n ]];
	then
		break
	fi
done
