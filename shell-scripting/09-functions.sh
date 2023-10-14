#!/bin/bash

SCRIPT_NAME=$0
DATE=$(date +%F)
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#COLORS
R="\e[31m"
G="\e[32m"
N="\e[0m"

#TO intall MySQL
VALIDATE(){
    #$1 --> it will receive arugument1, $2 is argument 2
    if [ $? -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "ERROR: Please run with root access"
    exit 1
fi

#This function should validate previous command and inform user SUCCESS or FAILURE


yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing POSTFIX"
