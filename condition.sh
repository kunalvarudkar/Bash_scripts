#!/bin/bash

UNAME="payload"
echo "Enter password for user $UNAME"
read PASS

if [ "$PASS" = "password" ];
then
	echo "Welcome $UNAME"
else
	echo "Access Denied: Incorrect Password !!!"
fi








#--------------------------S-Y-N-T-A-X----------------------------
#	if [condition];
#	then
#	_tab_ condition
#	fi or else             ****
#		condition
#	fi			***
#
#
# ****   if you dont use else then close the if loop with -> fi
# ****   if you use else then fi will be use at -> *** to close if loop
#
