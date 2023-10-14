#!/bin/bash

#TO intall MySQL

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "ERROR: Please run with root access"
    exit 1
fi

yum install mysql -y

if [ $? ne 0 ]
then
    echo "Installation of MySQL is ERROR"
    exit 1
else
    echo "Installation of MySQL is SUCCESS"
fi

yum install postfix -y

if [ $? ne 0 ]
then
    echo "Installation of POSTFIX is ERROR"
    exit 1
else
    echo "Installation of POSTFIX is SUCCESS"
fi
