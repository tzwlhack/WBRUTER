#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 14-01-2019 
####

help() {
cat << "EOF"

      \_/         -a) ANDROID CLI   - Brute force attack an android device with 100% guarantee to crack pin
     (* *)        -A) ANDROID GUI   - Brute force attack android device via gui/login screen (OLD METHOD)
    __)#(__       -G) GPG           - Dictionary attack for break the encryption of gpg files
   ( )...( )(_)   -g) GMAIL         - Brute force attack an gmail account
   || |_| ||//    -h) HELP          - Print this help, duh!
>==() | | ()/     -l) LINUX         - Dictionary attack the root password of any linux system
    _(___)_       -r) RAR           - Dictionary attack for break the encryption of rar files
   [-]   [-]      -z) ZIP           - Brute force and dictionary attack a zip encryptedfile
                 
~~~~~~~~~~~~~~~   

  wbruter v1.6

                 brute force tool that is written in pure bash code and is meant to be as simple as possible
EOF
}
