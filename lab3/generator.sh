#!../../../bin/bash

echo "$$" > genPID.txt

while true; do
        read LINE
	echo "$LINE" > pipe
done
	
