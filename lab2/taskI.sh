#!../../../bin/bash

ps u | awk '{if ($1 = "$USER") print $2 "\t" $11}'
