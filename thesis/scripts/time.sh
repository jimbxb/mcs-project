#!/bin/bash

DROP=2

class=$1
wybe=$2
trials=$3
dir=$4
flags=${@:5}

find "$dir" -type f \( -name "*.o" -o ! -name "*.*" \) -exec rm {} +

for prog in `ls "$dir"*.wybe`
do
    exe=`echo -e "$prog" | sed 's/[.]wybe$//'`
    in=`echo -e "$exe" | sed 's/\/\([^/]*\)$/\/..\/input\/\1.in/'`
    obj=`echo -e "$prog" | sed 's/[.]wybe$/.o/'`
    "$wybe" $flags "$exe"
    stat=$(/usr/lib/linux-tools-5.4.0-99/perf stat \
        --repeat "$(($trials + $DROP))" --table \
        --event task-clock \
        -- ./scripts/run.sh "$in" "$exe" 2>&1 >/dev/null)
    echo -n $prog,$class,
    echo "$stat" \
        | grep --perl-regexp --only-matching "^.*?\K\d+[.]\d+(?= \()" - \
        | tail --lines=$trials \
        | paste --serial --delimiters=, -
    >&2 echo -n .
done
>&2 echo
