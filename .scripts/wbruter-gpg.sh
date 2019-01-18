#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 03-08-2018 
####

gpg_attack() {
    read -p "GPG File: " GPG_FILE
    read -p "Wordlist: " WORDLIST
    echo -e ""
    echo -e "Target File: $GPG_FILE"
    echo -e "Wordlist: $WORDLIST"
    echo -e ""
    read -p $'If everything looks ok, type yes to begin the brute attack: (yes/no): ' ready
if [ $ready = "yes" ]; then                                                                                                                                               # Check IP and ask user if he is ready
   echo -e "Bruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime..\n"
for word in $(cat $WORDLIST); do 
    echo $word | gpg --passphrase-fd 0 -q --batch --allow-multiple-messages --no-tty  --output $GPG_FILE -d $GPG_FILE 2> /dev/null
    echo -e "Wrong password: \e[1;31m$word\e[0m"
done;
if [ $? = "0" ]; then
    echo "--------------------------------------"
    echo -e "GPG passphrase: \e[1;32m${word}\e[0m";
    echo "--------------------------------------"
    exit 0;
fi

fi
}

gpg_attack
