#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
	echo "Can't run without root!"
	exit 1
fi

DATE_STRING="$(date +%Y%m%dT%H%M%S)"
DIR_NAME="snapexport_${DATE_STRING}"

mkdir -p $DIR_NAME

# copy all contents
cp -a /data/user/0/com.snapchat.android/files/file_manager/chat_snap $DIR_NAME

if [ $? -ne 0 ]; then
	echo "Export failed!"
	exit 1
else
	echo "Export succeeded!"
	exit 1
fi

