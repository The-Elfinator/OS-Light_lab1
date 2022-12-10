#!../../bin/bash

lastDir=$(ls $HOME -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort --reverse | head -1)
if [[ ! -d $lastDir ]];
then
	echo "No backup directory! Nothing to upback"
	exit
fi
restore=$HOME/restore
if [[ ! -d $restore ]];
then
	mkdir $restore
fi
for file in $(ls $HOME/$lastDir -1)
do
	oldVersion=$(echo "$file" | grep -E "+\.[0-9]{4}-[0-9]{2}-[0-9]{2}")
	if [[ "$oldVersion" == "" ]];
	then
		cp "$lastDir/$file" "$restore/$file"
	fi
done
