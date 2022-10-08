#! ../../../bin/bash
let id="1"
while [[ -n "$id" ]]; do
	read id tag other
	if [[ "$tag" == "INFO" ]]; then
		echo "${id} ${tag} ${other}" >> info.log
	fi
done < ../../../var/log/anaconda/syslog
