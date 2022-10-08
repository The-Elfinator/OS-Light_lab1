#! ../../../bin/bash

if [[ "$HOME" == "$PWD" ]]; then
	echo "$HOME"
	exit 0
else
	echo "It seems like home and working directories are differents! (-_-)"
	exit 1
fi
