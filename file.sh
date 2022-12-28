#!../../../bin/bash

N=$1
i=1
while [[ $i -le $N ]];
do
	bash file_eval.sh $i
	let i=$i+1
done
