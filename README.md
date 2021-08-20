<h1 align="center">snapcatch</h1>
<p align="center">
Save Snaps without letting others know. </br>Recover old Snaps that have “disappeared” from Snapchat
</br>
Inspired by <a href="https://github.com/sdushantha/snaprecovery">snaprecovery</a>
</br>
<img src="https://user-images.githubusercontent.com/10338882/130289966-e789022d-12cf-4b0f-b120-008145723a63.png" alt="pic preview">


# Dependencies
This script is built for rooted Android devices, but requires no further dependencies or enabled features.

Tested on LineageOS 17.1 (Android 10, rooted with Magisk) with Snapchat 11.41.1.39. 

# Why
[Snaprecovery](https://github.com/sdushantha/snaprecovery/) uses `adb` to recover snaps. We found this not to be practical, so we made a script that you can quickly run locally on your phone. 

# How it works
When you receive a Snap, the content is saved in a temporary folder so the content can be viewed by the user. If your phone is rooted, or if you have given yourself access to this folder, you can simply copy the snaps over to another location and store them there. 

Snaps that were 'deleted' will stay in the temporary folder until the app terminates or during logout, and can thus be recovered using this method. Snaps not wiped, so you could, with proper forensic tools, recover 'deleted' snaps that way too.

Snaps that are sent to the user can also be opened/saved/viewed using the script without the knowlegde of the author, even if the snap was time limited, circumventing some of Snapchat's main privacy and security features.


# Usage
The script takes, as of now, no arguments. It is recommended to run as root. Although the script can, if it has the proper permissions, run without root. 

The script will create a folder in the location it's run at (`./snapexport_yyyymmddMMSS`), resolve the type of Snap automagically, and copies them to that folder.

Since most Android ROMs mount their `sdcard` and `emulated` storages as `no-exec`, you can't use `./snapcatch.sh`.

However, you can run the script by launching a new shell: `sh snapcatch.sh`
