#!/bin/bash
echo "Enter a number::"
read NUM
if [ $NUM -gt 100 ]
then
    echo " The entered number is greater than 100"
else
    echo " The entered number is less than or equal to 100"
fi
