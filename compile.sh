#!/bin/sh

if [[ -z "$1" ]]
then
  echo "Usage: $0 <filename.adb>"
  exit 1
fi

a=yaku@10.0.0.3
d="/home/yaku/"
e="export "PATH="/home/yaku/ada/ada-bin/bin/:$PATH"
k="~/.ssh/yaku"

rsync -e "ssh -i $k" -- * "$a":"$d"/
ssh -i "$k" -t "$a" \
  "cd $d ; $e ; \
    echo ==================== ; \
    rm ./${1%.adb} ; \
    gnatmake '$1' ; \
    echo ==================== ; \
    true"
