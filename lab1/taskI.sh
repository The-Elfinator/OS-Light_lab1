#!../../../bin/bash

let a=$1
let b=$2
let c=$3
let m1=0
let m2=0
if [[ "$a" -ge "$b" ]]; then
	m1=$a
else m1=$b
fi
if [[ "$m1" -ge "$c" ]]; then
	m2="$m1"
else m2="$c"
fi
echo "$m2"
