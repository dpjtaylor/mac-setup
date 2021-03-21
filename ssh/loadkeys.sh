#!/usr/bin/env bash

# ------------------------------------------------------
# Select key to import
printf "Please select an ssh key to import\n\n🏡  1) Personal\n📅  2) Work\n☠️   q) Exit\n\n"
echo -n "Enter your selection and press [ENTER] (default is 1, Personal): "
read KEY_DIR_SELECTION
echo
if  [ "$KEY_DIR_SELECTION" == "2" ]; then
	DIR="/Users/$USER/.ssh/work"
	SELECTED="Work"
elif [ "$KEY_DIR_SELECTION" == "q" ]; then
	echo "Bye!"
	exit 1
else
	DIR="/Users/$USER/.ssh/personal"
	SELECTED="Personal"
fi
echo "Selected key: $SELECTED ($DIR/id_rsa)"

# ------------------------------------------------------
# Select hours
printf "How long do you want the key to keep the key valid for?\n\n🕛  12) 12\n🕖  X) Custom\n☠️   q) Exit\n\n"

echo -n "Enter number of hours [ENTER] (default is 12 hours): "
read HOURS
echo


if [ "$HOURS" == "q" ]; then
	echo "Bye!"
	exit 1
fi

if [ -z $HOURS ]; then
  HOURS=12
fi

echo "Hours selected: $HOURS"

# ------------------------------------------------------
# Import key
set -e
KEY=$DIR/id_rsa
/usr/bin/ssh-add -D
/usr/bin/ssh-add -t ${HOURS}H $KEY
#/usr/sbin/diskutil umount force $DIR # Use if script is on a USB key
