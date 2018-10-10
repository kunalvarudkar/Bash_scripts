#developer ==> paylaod
#script for cracking passsword, whose password is the filename of residing zip file.
#Challenge => eternal loop (misc) , hackthebox

#!/bin/bash

while :
do
	filename=$(ls *.zip | head -n1);
	password=$(strings $filename | grep .zip | cut -d "." -f1 | head -n1);
	echo "pswd=$password"
	unzip -P $password $filename
	if [ $filename = "6969.zip" ];
	then
		echo "=======> PASSWORD didnt matched for $filename <======="
		exit 0
	else		
		rm -rf $filename
	fi
done

#=========TODO===========
#0 read filename -> store in var
#1 read pass inside folder
#2 use that pass to unzip
#3 delete the old file
#4 go to 0 from new file
