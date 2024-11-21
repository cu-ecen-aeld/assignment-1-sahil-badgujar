#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Error: Two arguments required. Usage: $0 <writefile> <writestr>"
	exit 1
fi

writefile="$1"
writestr="$2"

dirpath=$(dirname "$writefile")

if [ ! -d "$dirpath" ]; then 
	mkdir -p "$dirpath"
	if [ $? -ne 0 ]; then
		echo "Error: Failed to create directory $dirpath."
		exit 1
	fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
	echo "Error: Failed to write to file $writefile."
	exit 1
fi

echo "File Created: $writefile"
exit 0

