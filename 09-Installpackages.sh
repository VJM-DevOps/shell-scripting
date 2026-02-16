#!/bin/bash

R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"

Log_Directory="var/log/shell-script-logs"
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1 )
logfile="$Log_Directory-$scriptname-$timestamp.log"

validate (){
    
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R Failure $N"
        exit 1
    else
        echo -e "$2... $G Success $N"
    fi

}

user=$(id -u)
if [ $user -ne 0 ]
then
    echo -e "$R sudo access nedded to execute this script $N"
    exit 1
fi

echo " Script execution starts:: $timestamp" &>>$logfile

dnf list installed mysql &>>$logfile
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$logfile
    validate $? "Installing mysql"
else
    echo -e "mysql is already $Y installed $N"
fi

dnf list installed nginx &>>$logfile
if [ $? -ne 0 ]
then
    dnf install nginx &>>$logfile
    validate $? "nginx installation"
else
    echo -e "nginx is already $Y installed $N"
fi





# dnf list installed msql-server
# if [ $? -eq 0 ]
# then
#     echo -e " Mysql already $Y installed $N "
#     exit 1
# else
#     dnf install mysql-server -y
#     if [ $? -ne 0 ]
#     then
#         echo -e " Mysql installation.....$R Failuer $N "
#         exit 1
#     else
#         echo -e " Mysql-server installation.....$G Success $N "
#     fi
# fi

