#!../../bin/bash

echo "Enter name of file with students: "
read fileName	
awk ' { group=$4 ; mag=substr(group, 2, 1) ; course=substr(group, 3, 1) ; year=course; if (mag == 4) year+=4 ; print $1, $2, $3, year }' $fileName

