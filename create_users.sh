#!/bin/bash

INP_FILE="/etc/passwd"
USRNAME="/root/usr.csv"

while IFS=',' read -r col01 col02
do
    grep -w "$col01" "$INP_FILE" >/dev/null
    if [[ $? == "0" ]] 
    then
        echo "$col01 User Already Exists!!!"
        
        read -p "DO YOU WANT TO DELETE THE USER (yes)/(no):-" SELECT
        if [[ $SELECT == "yes" ]]
         then 
            echo "User is deleting...."
            userdel "$col01"
            echo "USER IS SUCCESSFULLY DELETED"
        elif [[ $SELECT == "no" ]] 
        then 
            echo "User deletion cancelled"
        else
            echo "Invalid selection. User deletion cancelled."
        fi
    else 
        echo "User Not Found. Adding User..."
        useradd -d "$col02" "$col01"
        echo "User Added Successfully in the given Path"
    fi
done < "$USRNAME"
