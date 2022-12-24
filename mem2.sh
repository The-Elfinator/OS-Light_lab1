#!../../bin/bash

if [ -f report2.log ];
then
	rm report2.log
fi
touch report2.log
step=0
const=100000
while true; 
do
	arr+=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  
	let step=$step+1
	let mod=$step%$const
	if [[ $mod -eq 0 ]]; 
	then
		let length=$step*10
		echo $length >> report2.log
	fi
done
