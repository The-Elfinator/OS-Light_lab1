#!../../../bin/bash

i=$1
cp "input$i.txt" "$i.txt"
fileName="$i.txt"
j=0
let fileSize=654*140
while [[ $j -lt $fileSize ]];
do
	read y
	let x=$y*2
	echo "$x" >> $fileName
	let j=$j+1
done < $fileName
rm $fileName
