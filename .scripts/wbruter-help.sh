#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 14-01-2019 
####

help() {
cat << "EOF"


      ___
     |   |        -a) ANDROID_CLI   - Brute force attack an android device with 100% guarantee to crack pin
    _|___|_       -A) ANDROID_GUI   - Brute force attack android device via gui/login screen (OLD METHOD)
     (* *)        -f) FTP           - Dictionary attack for for any ftp/ftps server
    __)#(__       -g) GMAIL         - Dictionary attack for gmail accounts
   ( )...( )(_)   -G) GPG           - Dictionary attack for break the encryption of gpg files
   || |_| ||//    -h) HELP          - Print this help, duh!
>==() | | ()/     -r) RAR           - Dictionary attack for break the encryption of rar files
    _(___)_       -z) ZIP           - Brute force and dictionary attack a zip encryptedfile
   [-]   [-]      -Z) ZNC           - Dictionary attack for znc bouncer login (web)
~~~~~~~~~~~~~~~~  -v) VERSION       - Print version of wbruter
| wbruter v1.6 |
~~~~~~~~~~~~~~~~  brute force tool that is written in pure bash code and is meant to be as simple as possible

EOF
}

