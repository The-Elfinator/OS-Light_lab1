#!../../../bin/bash

ps uax | tail -n +2 | sort --key=9 --reverse | head -1 | awk '{print $2}'
