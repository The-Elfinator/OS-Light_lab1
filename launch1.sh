#!../../../bin/bash

N=$1
x=17500
y=22350
i=0
while [[ $i -lt $N ]];
do
	bash "eval.sh" $x $y &
	let x=$x+20
	let y=$y+20
	let i=$i+1
done
wait
