#!/bin/bash

leapyear() {
    local year=$1
    (( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
}

Dayoftheyear() {
    local year=$1
    local month=$2
    
    if (( month < 1 || month > 12 )); then
        echo "Invalid month"
        return
    fi

    days_in_month=(0 31 28 31 30 31 30 31 31 30 31 30 31)
    if leapyear $year; then
        days_in_month[2]=29
   echo "Leap year" 
   fi

    echo ${days_in_month[month]}
}

Dayoftheyear "$1" "$2"

