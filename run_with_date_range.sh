#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 from_date to_date"
    echo "   ex) $0 2021-05-01 2021-05-10"
    exit 1
fi

from_date=$1
to_date=$2

hms="00:00:00"

# to_date 까지 포함
until [[ $from_date > $to_date ]]; do

    cmd="TODO"
    echo $cmd
    $cmd
    if [ $? -ne 0 ]; then
        echo "command failed... $cmd"
        exit 1
    fi

    #from_date=$(date -I -d "$from_date $hms + 1 day")
    from_date=$(date -I -d "$from_date $hms 60 minute")
    hms=$(date "+%H:%M:%S" -d "$from_date $hms 60 minute")
done
