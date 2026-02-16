#!/bin/bash

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

user=$(id -u)
if [ $user -ne 0 ]
then
    echo -e "$R sudo access nedded to execute this script $N"
    exit 1
fi

dnf list installed msql-server
if [ $? -eq 0 ]
then
    echo -e " Mysql already $Y installed $N "
    exit 1
else
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then
        echo -e " Mysql installation.....$R Failuer $N "
        exit 1
    else
        echo -e " Mysql-server installation.....$G Success $N "
    fi
fi

dnf list installed nginx
if [ $? -eq 0 ]
then
    echo -e " nginx already $Y installed $N "
    exit 1
else
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo -e " nginx installation.....$R Failuer $N "
        exit 1
    else
        echo -e " nginx installation.....$G Success $N "
    fi
fi


