#!../../../bin/bash

ps uax | awk '{print $2 " " $11}' | tail -n +2 | grep -s "/sbin/"
