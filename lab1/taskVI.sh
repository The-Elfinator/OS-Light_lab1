#! ../../../bin/bash

while read a b tag other; 
do
	if [[ "$tag" == "(WW)" ]]; then
		tag="Warning:"
		echo "${a} ${b} ${tag} ${other}" >> full.log
	else
		if [[ "$tag" == "(II)" ]]; then
			tag="Information:"
			echo "${a} ${b} ${tag} ${other}" >> full1.log
		fi
	fi
done < ../../../var/log/anaconda/X.log

while read str;
do
	echo "$str" >> full.log
done < full1.log
rm full1.log

cat full.log

