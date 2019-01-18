#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 18-01-2019
####

zip_attack() {
read -p "ZiP File: " zippie
read -p "Wordlist: " wordish
printf "%50s\n" | tr ' ' '='
while read line; do
   unzip -P $line -o $zippie &> /dev/null
if [[ $? -eq 1 ]]; then
printf "Wrong password: \e[1;31m$line\e[0m\n"
else
printf "%50s\n" | tr ' ' '='
printf "Password Found: \e[1;32m$line\e[0m\n"
printf "%50s\n" | tr ' ' '='
exit
fi
done < $wordish
printf "%50s\n" | tr ' ' '='
echo "No password matched in $wordish - Try another wordlist"
printf "%50s\n" | tr ' ' '='
}
