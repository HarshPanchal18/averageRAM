#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Friday 22 July 2022 06:35:06 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

FILE=$(pwd)/.numbers.dat

if [ ! -f "$FILE" ]
then
    echo -e "x=0\ny=0\navg=0" >.numbers.dat
fi

x=$(grep x .numbers.dat | cut -c3-)
temp=$(neofetch | grep Memory | cut -c39- | cut -d "M" -f1)
y=$(/usr/bin/expr $(grep y .numbers.dat | cut -c3-) + $temp)
x=$(/usr/bin/expr $x + 1)
avg=$(/usr/bin/expr $y / $x)
avg=$(/usr/bin/expr $avg - 6)

sed -i "/x/c\x=$x" .numbers.dat
sed -i "/y/c\y=$y" .numbers.dat
sed -i "/avg/c\avg=$avg" .numbers.dat
