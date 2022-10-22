#! ../../../bin/bash
pid_max=0
max_mem=0
for pid in $( ps uax | tail -n +2 | awk '{print $2}' ); do
	        mem=$(grep -s VmRSS "../../../proc/$pid/status" | awk '{print $2}')
		if [[ $mem != "" ]]; then
			if [[ $mem -ge $max_mem ]]; then
				max_mem=$mem;
				pid_max=$pid;
			fi
		fi
done
echo "Process with PID=$pid_max have MaxMeory=$max_mem"
