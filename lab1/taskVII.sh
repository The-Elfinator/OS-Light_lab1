#! ../../../bin/bash

mail="[a-zA-Z0-9][a-zA-Z0-9\.]*@[a-zA-Z0-9]+\.[a-zA-Z0-0]+"
grep -E -h -s -o -w $mail ` sudo find "../../../etc" ` | awk '{print $1}' > emails.lst
