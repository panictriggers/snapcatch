# Snapcatch
Inspired by [snaprecovery](https://github.com/sdushantha/snaprecovery). We wanted to create a script (or possibly even an app) that can run on your phone, not with just `adb`.

The script is really simple but allows to capture "disappeared" snaps from Snapchat.

**Requires a rooted device!**

# Usage
The script takes, as of now, no arguments. Run the script, and view the cashed "disappeared" messages. That's all!

Since most Android ROMs mount their `sdcard` and `emulated` storages as `no-exec`, you can't use `./snapcatch.sh`.

However, you can run the script by launching a new shell: `sh snapcatch.sh`
