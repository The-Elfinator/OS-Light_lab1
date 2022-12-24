#!../../bin/bash

if [ -f report.log ];
then
	rm report.log
fi
touch report.log
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
		echo $length >> report.log
	fi
done
