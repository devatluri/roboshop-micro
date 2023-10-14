#!/bin/bash

DATE=$(date +%F)
mkdir -p /home/centos/shellscript-logs
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
USERID=$(id -u)

LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[0m"
Y="\e[033m"

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

#Validation

VALIDATE()
{
    if [$1 -ne 0];
    then
        echo -e "Installing $2 ..$R FAILURE $N"
    else    
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}
#all arguments are in $@
for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [$? -ne 0]
    then   
        echo "$i is not installed, let's install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed"
    fi
done

