#!/bin/bash

order=$1
wybe=$2
dir=$3
flags=${@:4}

find "$dir" -type f \( -name "*.o" -o ! -name "*.*" \) -exec rm {} +

for prog in `ls "$dir"*.wybe`
do
    exe=`echo -e "$prog" | sed 's/[.]wybe$//'`
    obj=`echo -e "$prog" | sed 's/[.]wybe$/.o/'`
    "$wybe" $flags "$exe"
    echo -n $prog,$order,
    echo -n $(du --block-size=1 --apparent-size $obj | cut --fields=1),
    echo -n $(du --block-size=1 --apparent-size $exe | cut --fields=1),
    echo $(cat $prog | sed 's/#.*$//' \
                     | grep -ve '^\s*$' \
                     | wc -l)
    >&2 echo -n .
done
>&2 echo
