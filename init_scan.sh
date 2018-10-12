#developer ==> payload
#Automated script for initiating nmap in structured order.

#shell ref = function https://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
#	     color    https://stackoverflow.com/questions/16843382/colored-shell-script-output-library

#==========TODO==========
# 1.create/check HTBMachine folder 
# 2.Create MC_Name Dir
# 3.Create Sub Dir - scans findinds code
# 4.Print pwd
# 5.Start Nmap scan ( store result in scans dir )
# 6.Ask for scanning Vuln nmap
# 7.remove .gnmap & .xml extension
# 8.EXIT

#!/bin/bash

red='\e[0;31m';
green='\e[0;32m';


init_scan()
{
	ip=$1
	mc_name=$2
	echo -e "${green}[+]Creating Scans Findings Code[+]"
	cd ~/Desktop/HTBMachines/$mc_name
	mkdir Scans Findings Code
	cd Scans
	echo -e "${green}[+]Started to scan nmap -sV -sC -sS -p- -T4 -oA fullport_$ip $ip[+]"
	sudo nmap -sV -sC -sS -p- -T4 -oA fullport_$ip $ip
	rm -rf *.gnmap *.xml
	echo -e "${red}[!]Do you want to perform Vuln scan for $ip ( yes/no )[!]"
	read response
	if [ $response = "yes" ];
	then
	    vuln_scan $ip $mc_name
	elif [ $response = "no" ];
	then
	    echo "++++++++++++++ Quiting ++++++++++++++"
	    exit 0
	else
		exit 0
	fi
	
}

vuln_scan()
{
    ip=$1
    mc_name=$2
    cd ~/Desktop/HTBMachines/$mc_name/Scans/
    echo -e "${green}[+]Started Vuln scan -> nmap -p- -T4 --script vuln -oA vuln_fullport_$ip $ip[+]"
    sudo nmap -p- -T4 --script vuln -oA vuln_fullport_$ip $ip
    rm -rf *.gnmap *.xml
    
}

echo -e "${red}[!]Enter IP & Machine name=[!]"
read IP MC_NAME

echo -e "${red}[!]Checking for HTBMachines Dir in ~/Desktop[!]"
CHECK_DIR=$(ls ~/Desktop | grep HTBMachines | head -n1);
if [ $CHECK_DIR = "HTBMachines" ];
then
	echo -e "${red}[!]$CHECK_DIR already exist making dir inside[!]"
	mkdir ~/Desktop/$CHECK_DIR/$MC_NAME
	echo -e "${green}[+]Created $MC_NAME dir[+]"
	init_scan $IP $MC_NAME

else
	echo -e "${red}[!]$CHECK_DIR doesnt exist.. Creating HTBMachines[!]"
	mkdir ~/Desktop/HTBMachines
	mkdir ~/Desktop/HTBMachines/$MC_NAME
	echo -e "${green}[+]Created $MC_NAME dir[+]"
	init_scan $IP $MC_NAME
fi


