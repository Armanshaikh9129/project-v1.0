#!/bin/bash

ALERT=70
USAGE=`df -h | grep rootfs | awk '{print $5}' | tr -d %`
EMAIL="armansk9129@gmail.com"

if [[ $USAGE -gt $ALERT ]]
then 
     echo -e "system $USAGE% full"
     echo -e "sending email"
     echo -e "system disk is out of space" | mail -s "Disk alert" $EMAIL
else
     echo -e "Disk is in Healthy condition"
fi
