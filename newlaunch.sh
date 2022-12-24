#!../../bin/bash

k=30
n=3000000
for (( i=0; i < $k; i++ ))
do
	bash newmem.sh $n &
	sleep 1
done
