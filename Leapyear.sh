#!/bin/bash

leapyear() {
    local year=$1
    (( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
}

Dayoftheyear() {
    local year=$1

    if leapyear $year; then
   echo "Leap year"
else
echo "Common year"
   fi

}

Dayoftheyear "$1" "$2"

