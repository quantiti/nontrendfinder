#!/bin/bash
#receive the network ranges from $1
if [ -z "$1" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
	echo "Usage: $0 network_range"
	echo "e.g: $0 10.68.5.0/24"
fi
#scan port 445 to detect windows computers
masscan -p445 --rate 20000 $1 | cut -d' ' -f6 > "445.txt"
masscan -p64000 --rate 20000 $1 | cut -d' ' -f6 > "64000.txt"
echo "These computer has not installed trend:"
fgrep -v -f 64000.txt 445.txt
