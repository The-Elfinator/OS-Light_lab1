#!../../../bin/bash

cycle()
{
	while [[ 1 -ge 0 ]]; do
		let x=$SECONDS/2
	done;
}

cycle &
pid1=$!
cycle &
pid2=$!
cycle &
pid3=$!

cpulimit -p $pid1 -l 5 &

kill $pid3
