#! ../../bin/bash

fileName=$1
if [ $# -eq 0 ]; 
then
	echo "Name of file expected!"
	exit
fi
if [ $# -ne 1 ]; 
then
	echo "You should tell only one name of file"
	exit
fi
if [ ! -e $fileName ]; 
then
	echo "File not found!"
	exit
fi
if [ -d $fileName ];
then
	echo "Expected file name, found directory"
	exit
fi
if [ "$fileName" == "rmtrash.sh" -o "$fileName" == "trash.log" -o "$fileName" == "untrash.sh" -o "$fileName" == "backup.sh" -o "$fileName" == "upback.sh" -o "$fileName" == "backup-report" ]; 
then
	echo "Not enough permissions to delete this file"
	exit
fi
trashDir=$HOME/trash
trashLog=$HOME/trash.log
if [ -d $trashDir ];
then 
	:
else
	mkdir $trashDir;
fi
linkFile=$(date +%N)
ln $fileName "$trashDir/$linkFile"
rm $fileName
if [ -e $trashLog ]; 
then
	:
else
	touch $trashLog
fi
echo "$PWD/$fileName:$linkFile" >> $trashLog
echo "File has been deleted successfully!"
