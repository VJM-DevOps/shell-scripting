#!/bin/bash
USERID=$(id -u)
if [ $? -ne 0 ]
then
    echo "sudo acess required to run this script"
    exit 1
fi

dnf list installed mysql
if [ $? -eq 0 ]
then
    echo "mysql is already installed"
    exit 1
else
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation... Failure"
        exit 1
    else
        echo "mysql installation... Sucess"
    fi
fi
