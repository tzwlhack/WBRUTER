#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 18-01-2019
####

rar_attack() {
if [[ -n $(unrar -v &> /dev/null) ]]; then
    echo "unrar is required for this tool, aborted."
    exit 1
fi

wordlist="wordlist"
read -p "RAR Filename: (/path/to/file.rar): " rartarget

if [ ! -f $wordlist ]; then
   printf "Can't find $wordlist, aborted\n"
   exit
fi

if [[ ! -a $rartarget ]]; then
   printf "Sorry, can't $rartarget a such file, aborted\n"
   exit
fi
   printf "\n%51s" | tr ' ' '='
   printf "\nBruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime..\n"
   printf "%51s\n" | tr ' ' '='
   sleep 2
while read line; do
   echo "$line" | unrar p $rartarget &> /dev/null
if [[ $? = "0" ]]; then
   printf "%51s" | tr ' ' '='
   printf "\nPassword has been found: \e[1;32m$line\e[0m"
   printf "\n%51s\n\n" | tr ' ' '='
else
   printf "Wrong password: \e[1;31m$line\e[0m\n"
fi
done < wordlist
}
