#!/bin/bash

#Script Name: set-network-services-order.sh

#Author: Daniel Arauz

#Date: May 26, 2018

#Description: This script sets Network Services Order. 

clear
if [ -e NewNetworkServiceOrder.dat ]
	then
	rm -r NewNetworkServiceOrder.dat
fi
echo "+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+"
echo "| SET NETWORK SERVICES ORDER:                                                 |"
echo "+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+"
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "Date:${RED} $(date)${NC} |  Hostname:${RED}$(hostname)${NC}\n"
echo ""
echo "+- - - - Current Network Service Order - - - - -+" 
networksetup -listnetworkserviceorder | cut -d')' -f2 | sed '/^$/d' | sed '1d'
echo "+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+"
echo 
echo
NumberOfServices=$(networksetup -listnetworkserviceorder | cut -d')' -f2 | sed '/^$/d' | sed '1d' | sed -e 's/^[ \t]*//' | wc -l)
count=1  
while [ $count -le $NumberOfServices ]  
do  
	read -p "Input the Network Service that you want in position $count, then Press [ENTER] : " NetworkServiceOrderVar
	count=$(( $count + 1 ))
        echo $NetworkServiceOrderVar >> NewNetworkServiceOrder.dat
done  
clear
# echo "----- Contents of NewNetworkServiceOrder.dat below this line ----+"
# cat NewNetworkServiceOrder.dat
# rm -r NewNetworkServiceOrder.dat
#echo "----- Contents of NewNetworkServiceOrder.dat above this line ----+"

echo "NEXT STEP: Learn how to extract each line from the NewNetworkServiceOrder.dat file and encapsulate each line content into a variable."
echo "(Then insert each variable in their corresponding order in the following command: networksetup -ordernetworkservices "$string1" "$string2" "$strin3")"

echo "Executing command..."
# networksetup -ordernetworkservices "$string1" "$string2" "$string3" "$stringETC.." 
echo
echo
echo "+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+"
echo "+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+"
if [ -e NewNetworkServiceOrder.dat ]
        then
        rm -r NewNetworkServiceOrder.dat
fi
read -p "Press enter to continue"
clear

