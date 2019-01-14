# WBRUTER


#### README

This is a minimal tool for bruteforce attack various kind of things, read help for more info. The tool has been written in pure bash without any third party bruteforce tools.

_Many times it's the easiest methods that are the most powerful methods, it's just a matter of using your imagination ;-)_

#### News: 2019-01-08

I have decided to release my own tool for brute force pin locks wich is supported on all android devices. I have seen so many wikis/tutorials online that wont work for real on non-root devices, they are all kinda 
useless since you wont be able to delete the locksettings.db from data/misc path unless the device has been rooted and if the device has been rooted then there is no need for "hack/crack" the pin really, its a simple 'rm' 
command that is needed and that's NOT what  hacking/cracking is about. From now you will be able to crack any android device with 4 or 6 digits with **100%** guarantee to succeed within an hour or two. Of course the time
matters on how many threads you will use and what kind of device you got, in my video below you can see how wbruter gonna work in parallell mode for speedup the attack ;) My android device is an Huawei P8 Lite and it's 
a slow CPU + 3GB ram only so it's not THAT fast as the latest mobile devices are so it might be much faster on your android device if you have a newer one.

My earlier version in this repo is nowadays pretty useless since it's almost impossible to brute force the pin via login screen(GUI) since after 4 wrong pin code attempts we will be blocked for X seconds, and after 5 
attempts we getting blocked for even more seconds etc etc so it will take until forever kinda to succeed with that method and almost all devices with android installed has a protection that will wipe or factory reset the device 
to defaults after 4-10 wrong pin code attempts and then all data will be lost and it's _almost_ impossible to recover all data after a factory reset unless you realy know what you are doing. But hey, from now you really don't 
need to bother about these protections anymore.

I guarantee(all current android versions until 2018-01-13) you will be able to crack the pin aslong as USB Debugging has been enable. 
In my videos below i proove that my device is non-rooted and that it's actually gonna work no matter how many pins you will need until the pin has been cracked. I decided to  use +20 attempts just for this view and since we 
don't want to make the video too long. wbruter is the first tool online that has been released to public with this method afaik and open source. It's no reason to search on google for tips and tricks anymore for 'how-to break 
android pinlock' cause as you probably already has figure out that 90-95% of all sites (even some devs on xda-developers forum) claims that you can remove locksettings.db from data/misc dir but this is impossible unless your 
device has been rooted and if the device has been rooted then we dont need to crack anything as said earlier. Enjoy the videos below. Have fun with wbruter and don't do anything I wouldn't have done with this tool... ;-)

If you only care about to break android pins and just give a f**k about the other methods you can grab the android tool in .scripts/wbruter-android-v1.5.sh. Enjoy.

## For turn on usb debugging ON:

#### Via Android Device: 
settings -> about > press on build number 7 times and the developer settings will be enable, go back to settings and press on developer mode and then enable USB DEBUGGING. (If you just wanna try wbruter for fun, if it's a phone 
you have found on the street this is not possible unless you already know the pin :P)

#### Via a terminal emulator on device: 

     settings put global development_settings_enabled 1
     setprop persist.service.adb.enable 1

##### Preiew 1 - ANDROID CLI
![Screenshot](files/wbruter-cli.gif)

##### Preiew 2 - ANDROID CLI - PARALLEL
![Screenshot](files/wbruter-android-parallell.gif)

##### Preiew 3 - GMAIL
![Screenshot](files/wbruter-gmail.gif)

##### Preiew 4 - GPG
![Screenshot](files/wbruter--gpg.gif)

##### HOW TO

    git clone https://github.com/wuseman/WBRUTER
    cd wbruter; ./wbruter -option

    Thats it, easier than this, it can not be to bruteforce attack various devices/accounts

#### REQUIREMENTS

A linux setup would be good ;)

#### CONTACT 

If you have problems, questions, ideas or suggestions please contact
us by posting to info@sendit.nu

#### WEB SITE

Visit our homepage for the latest info and updated tools

https://sendit.nu & https://github.com/wuseman/

#### END!

