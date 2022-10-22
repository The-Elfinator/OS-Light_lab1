#! ../../../bin/bash
for pid in $( ps uax | tail -n +2 | awk '{print $2}' ); do
	if [[ $pid -ne $$ ]]; then
	        bytes=$(sudo grep -s rchar "../../../proc/$pid/io" | awk '{print $2}')
		if [[ $bytes != "" ]]; then
			echo "$pid $bytes" >> file.txt
		fi
	fi
done
sleep 60
awk '{newBytes = $(sudo grep -s rchar "../../../proc/$1/io"); delta=newBytes - $2; print "PID=" $1 " : " delta}' file.txt | sort --key=2 --reverse | head -3
rm file.txt
