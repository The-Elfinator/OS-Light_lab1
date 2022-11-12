#!../../../bin/bash
today=`date +"%u"`
echo "0-59/5 * * * $today taskI.sh" | crontab
