#!../../../bin/bash

N=20
i=0
while [[ $i -lt $N ]];
do
	j=0
	while [[ $j -lt 10 ]];
	do
		let n=$i+1
		echo "$n step:$j"
		time bash launch1.sh $n | grep "real"
		let j=$j+1
	done
	let i=$i+1
done
