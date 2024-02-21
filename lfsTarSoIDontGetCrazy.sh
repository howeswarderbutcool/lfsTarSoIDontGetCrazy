#!/bin/bash
# lfsTarSoIDontGetCrazy.sh

# $1 = URL
# $2 = File Name
# $3 = MD5 Checksum

if [ "$1" == "--help" ];
then
  echo "Usage: lfsTarSoIDontGetCrazy.sh URL FileName MD5Checksum"
  exit 0
fi


curl -LO "$1"
check=$(md5sum "$2" | awk '{print $1}')
echo "MD5 Checksum: $check"

if [ "$check" == "$3" ]; 
then
  tar -xvf "$2"
else
  echo "MD5 check failed"
fi

rm "$2"