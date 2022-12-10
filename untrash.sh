#!../../bin/basme=$1
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
if [ ! -d $HOME/trash ];
then
	echo "trash directory not found! Nothing to untrash"
	exit
fi
if [ ! -e $HOME/trash.log ]; 
then
	echo "trash.log not found! Nothing to untrash!"
	exit
fi
fileName=$HOME/$1
fileUntrashed=0
for line in $(cat $HOME/trash.log)
do
	#echo "$line"
	currentFile=$(echo $line | awk -F ":" '{print $1}')
	trashLink=$(echo $line | awk -F ":" '{print $2}')
	#echo "currentFile=$currentFile link=$trashLink"
	if [[ $fileName == $currentFile ]]; 
	then
		trashFile=$HOME/trash/$trashLink
		if [ -e $trashFile ];
		then
			echo "Do you really want to untrash this file - $currentFile ?[Y/N]";
			read accept
			#echo "$accept"
			if [[ $accept == "N" || $accept == "n" ]];
			then
				echo "Untrashing of file $currentFile has been canceled!"
				continue
			fi
			if [[ $accept != "Y" && $accept != "y" ]];
			then
				echo "Unknown answer has been found! Expected Y or N as input data! Please try again"
				exit
			else
				#echo "$(dirname $currentFile)"
				if [ ! -d $(dirname $currentFile) ];
				then
					echo "Directory $(dirname $currentFile) doesn't exist, file have been untrashed into home directory $HOME"
					ln $trashFile $HOME/$1
				else
					if [[ -e $currentFile ]];
					then
						echo "Dublicate name! File $currentFile already exist! Please, rename your file"
						read rename
						newCurrentFile=$(dirname $currentFile)/$rename
						ln $trashFile $rename
					else
						echo "File has been untrashed successfully!"
						ln $trashFile $currentFile
					fi

				fi
				rm $trashFile
				fileUntrashed=1
			fi
		fi
	fi
done
if [[ $fileUntrashed -eq 0 ]];
then
	echo "File $1 was not found in 'trash' directory!"
	echo "Please, make sure your input data is correct!"
fi

