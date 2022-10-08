#! ../../../bin/bash

read input
while [[ "$input" != "q" ]]; do
	ans="${ans} ${input}"
	read input
done
echo $ans
