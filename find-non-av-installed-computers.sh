#!/bin/bash
#receive the network ranges from $1
if [ -z "$1" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
	echo "Usage: $0 network_range"
	echo "e.g: $0 10.68.5.0/24"
fi
#scan port 445 to detect windows computers, ecluded printers
masscan $1 -p135,137,139,445,3389 --excludefile exclude.txt| cut -d' ' -f6 > "445-$2.txt"
#scan port 64000 to detect computers installed trend v14
masscan $1 -p64000 | cut -d' ' -f6 > "64000-$2.txt"
#scan port 17774 to detect computers installed trend v12
masscan $1 -p17774 | cut -d' ' -f6 >> "64000-$2.txt"
sort -u "445-$2.txt" -o "445-$2.txt"
sort -u "64000-$2.txt" -o "64000-$2.txt"
echo "These computer has not installed trend:"
fgrep -v -f "64000-$2.txt" "445-$2.txt"
