#!../../bin/bash
sourceDir=$HOME/source
if [[ ! -d $sourceDir ]];
then
	echo "Source directory was not found!"
	exit
fi
report=$HOME/backup-report
today=$(date +%F)
dirCreated=0
lastDir=$(ls $HOME -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort --reverse | head -1)
dateLast=$(date --date=$(ls $HOME -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort --reverse | head -1 | sed "s/^Backup-//") +%s)
#echo "$lastDir"
todayDir="$HOME/Backup-$today"
if [[ "$lastDir" == "" ]];
then
	#No directory named Backup
	mkdir $todayDir
	dirCreated=1
	curDir=$todayDir
else
	dateLast=$(date --date=$(ls $HOME -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort --reverse | head -1 | sed "s/^Backup-//") +%s)
	#echo "$dateLast"	
	let diffDate=($(date --date=$today +%s)-$dateLast)/60/60/24
	#echo "$diffDate"
	if [[ $diffDate -le 7 ]];
	then
		curDir=$HOME/$lastDir
	else
		mkdir $todayDir
		dirCreated=1
		curDir=$todayDir
	fi
fi
#echo "$curDir"
if [[ $dirCreated -eq 1 ]];
then
	echo "Backup directory has been created successfully at $today in $curDir" >> $report
	for file in $(ls $sourceDir -1) 
	do
		cp "$sourceDir/$file" "$curDir/$file"
		echo "$file" >> $report
	done
else
	changes=0
	echo "Backup directory has been updating at $today in $curDir" >> $report
	for file in $(ls $sourceDir -1)
	do
		if [ ! -f $curDir/$file ];
		then
			cp "$sourceDir/$file" "$curDir/$file"
			echo "New file: $file" >> $report
		else
			file1=$sourceDir/$file
			file2=$curDir/$file
			if cmp -s $file1 $file2 ;
			then
				# files are same
				:
			else
				mv "$curDir/$file" "$curDir/$file.$today"
				cp "$sourceDir/$file" "$curDir/$file"
				echo "File already exists. Old=$file.$today New=$file" >> logFile
				changes=1
			fi
		fi
	done
	if [[ $changes -eq 1 ]]; then
		while read line
		do
			echo "$line" >> $report
		done < logFile
		rm logFile
	fi
fi


