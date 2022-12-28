#!../../../bin/bash

N=20
i=1
while [[ $i -le $N ]];
do
	j=0
	while [[ $j -lt 10 ]];
	do
		echo "N=$i step=$j"
		time bash file1.sh $i
		let j=$j+1
	done
	let i=$i+1
done
