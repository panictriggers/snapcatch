#!/bin/bash
##please note this is a work in progress bash file, not a final product!

echo "Snapcatch v0.2"


# variables
TEMP_DIR="/data/user/0/com.snapchat.android/files/file_manager/chat_snap"
DATE_STRING="$(date +%Y%m%dT%H%M%S)"
DIR_NAME="snapexport_${DATE_STRING}"

echo -n "Checking if root..."

# Check for root and dir access
if [ "$(id -u)" -ne 0 ]; then
	echo "no"
	echo -n "Checking if access to snap dir..."
	if [ ! -w $TEMP_DIR ]; then
		echo "no"
		echo "Critical: Cannot access snapchat directory"
		exit 1
	else
		echo "yes"
	fi
else
	echo "yes"
	echo -n "Checking if snap dir exists..."
	if [ ! -w $TEMP_DIR ]; then
		echo "no"
		echo "Critical: Snapchat dir does not seem to exist"
		exit 1
	fi
	echo "yes"
fi


echo -n "Creating new directory..."
# create the destiny path for the "lost" images 
mkdir -p $DIR_NAME
echo "ok"

echo -n "Catching snaps..."
# get list of all files, as wel as their mime-type STILL NEEDS THE PATH ADDED
for FILE in $TEMP_DIR/*; do
 	EXTENSION=".unknown"

	if file $FILE | grep -q 'JPEG'; then
		EXTENSION=".jpg"
	elif file $FILE | grep -q 'data'; then
		EXTENSION=".mp4"
	fi

	FILENAME="${FILE##*/}${EXTENSION}"
	cp "$FILE" "${DIR_NAME}/${FILENAME}"
done

echo "ok"
# copy all contents
#cp -a  $TEMP_DIR $DIR_NAME
#ls -a $TEMP_DIR

if [ $? -ne 0 ]; then
	echo "Export failed!"
	exit 1
else
	echo "Export succeeded!"
	exit
fi
