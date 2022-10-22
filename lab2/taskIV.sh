#!../../../bin/bash


for pid in $( ps uax | tail -n +2 | awk '{print $2}' ); do
	ppid=$(grep -s PPid "../../../proc/$pid/status" | awk '{print $2}')
	if [[ $ppid != "" ]]; then
		time=$(grep -s sum_exec_runtime "../../../proc/$pid/sched" | awk '{print $3}' )
		switches=$(grep -s nr_switches "../../../proc/$pid/sched" | awk '{print $3}' )
		if [[ $time != "" && $switches != "" ]]; then
			art=$(awk "BEGIN {print $time/$switches}")
			echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art" >> output1.txt
		fi
	fi
done

sort --key=3 output1.txt --output=output.txt
rm output1.txt
