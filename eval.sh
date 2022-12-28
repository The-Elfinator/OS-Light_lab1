#!../../../bin/bash

x=$1
y=$2
echo "scale=1000;( ((sqrt($x * sqrt($x+$y))) + (e (sqrt($y + ($y / ($x + sqrt($y)) ) ))) ) / ((($x / $y) * ((sqrt ($x + sqrt($x + $y) * $x)) + (e (sqrt ($y + ($y / ($x + sqrt(sqrt($x) + $y) )))) )) + e (sqrt($x))) ) ) + ( e ( sqrt ($y + ($y / ($y + sqrt($x + sqrt($y + $x))))))) * ($x + sqrt($y + ($y / $x) + sqrt ($x + $y) ) )" | bc -l
