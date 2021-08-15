#!/bin/bash
##please note this is a work in progress bash file, not a final product!

if [ "$(id -u)" -ne 0 ]; then
	echo "Can't run without root!"
	exit 1
fi

# variables
TEMP_DIR = "/data/user/0/com.snapchat.android/files/file_manager/chat_snap"
DATE_STRING="$(date +%Y%m%dT%H%M%S)"
DIR_NAME="snapexport_${DATE_STRING}"

# create the destiny path for the "lost" images 
mkdir -p $DIR_NAME

# get list of all files, as wel as their mime-type STILL NEEDS THE PATH ADDED
for FILE in $TEMP_DIR ; do
 	EXTENSION=$(file --mime-type -b "$FILE" | sed 's/.*\///g')
	FILENAME=${FILE&EXTENSION}	 
	mv "$FILE" "$FILENAME"
done

# copy all contents
cp -a  $TEMP_DIR $DIR_NAME
ls -a $TEMP_DIR

if [ $? -ne 0 ]; then
	echo "Export failed!"
	exit 1
else
	echo "Export succeeded!"
	exit 1
fi
