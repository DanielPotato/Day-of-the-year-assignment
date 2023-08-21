#!/bin/bash

leapyear() {
    local year=$1
    (( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
}

Dayoftheyear() {
    local year=$1
    local month=$2
    local day=$3
    if (( month < 1 || month > 12 || day < 1 )); then
        echo "None"
        return
    fi

    days_in_month=(0 31 28 31 30 31 30 31 31 30 31 30 31)
    if leapyear $year; then
        days_in_month[2]=29
   echo "Leap year" 
   fi

    local day_of_year=0
    for (( i=1; i<month; i++ )); do
        (( day_of_year += days_in_month[i] ))
    done
    (( day_of_year += day ))
    echo $day_of_year
}

Dayoftheyear "$1" "$2" "$3"

