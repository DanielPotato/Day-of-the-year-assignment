#!/bin/bash

leapyear() {
    local year=$1
    (( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
}

year() {
    local year=$1
    local month=$2
    local day=$3
    if (( month < 1 || month > 12 || day < 1 || day > 31 )); then
    echo "None"
    return 0
    fi
    
    days_of_the_month=("31" "28" "31" "30" "31" "30" "31" "31" "30" "31" "30" "31")
    if leapyear $year; then
    days_of_the_month[1]=29
    fi
if (( days_of_the_month[month-1] < day )); then
     echo "None"
     return 0
     fi
     
     
    echo "${days_of_the_month[month-1]}"
    
    if leapyear $year; then
   echo "Leap year"
else
echo "Common year"
  
   fi
sum=0
   for (( i=0; i<month-1; i++ )); do
        (( sum+=days_of_the_month[i] ))
    done

    (( sum+=day ))
    echo "$sum" 
}

year "$1" "$2" "$3"

