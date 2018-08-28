#NOTE:- 
# check for command -> "help Test" or "help test"
# This command will show the usage option with different functionality like..
# -d for checking existence of directory
# -e for checking existence of file 
# & so ON .....

#!/bin/bash

if [ -x ~/Documents/bash_script/initial.sh ];    #check if the file can be executed by current user (true)[it returns True]
then
	echo "[+] File can be executed  [+]"
else				# if not exist [return False]
	echo "[-] File cannot be executed [-]"
fi
