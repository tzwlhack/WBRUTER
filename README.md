# WBRUTER

#### README

wbruter is is the first tool wich has been released as open source wich can guarantee **100%** that your pin code will be cracked aslong as usb debugging has been enable. wbruter also includes some other brute methods like dictionary attacks for gmail, ftp, rar, zip and some other file extensions. 

wbruter will allways try to bring support for rare protocols, wbruter wont contain common stuff like other brute tools cover like facebook, snapchat, instagram and you name it (except a few exceptions, very few)

_Many times it's the easiest methods that are the most powerful methods, it's just a matter of using your imagination ;-)_

## Enable USB-Debugging via the methods below:

#### Via GUI: 

Go to settings -> about > press on build number 7 times and the developer settings will be enable, go back to settings and press on developer mode and then enable USB DEBUGGING. If you found an android deviceon the street or something and want to break the pin this wont be possible unless you already know the pin so the device must have usb debugging enable for this to work. You wanna try this for fun then you can just enable usb debugging after you unlocked phone)

#### Via cli/adb: 

     settings put global development_settings_enabled 1
     setprop persist.service.adb.enable 1

#### Via GUI (old layout now use --androidgui 4 instead)
##### Please use the other method instead since many devices has been set to erase the device after "10/15 wrong pin attempts" and this wont happen with the CLI method.

![Screenshot](https://raw.githubusercontent.com/1939149/wbruter/master/files/wbruter.gif)

#### Via CLI:

![Screenshot](https://nr1.nu/archive/wbruter/previews/wbruter-cli.gif)

#### HOW TO

    git clone https://github.com/wuseman/WBRUTER
    cd WBRUTER; ./wbruter [-X]

#### REQUIREMENTS

A linux setup would be good ;)

#### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

#### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

#### END!
