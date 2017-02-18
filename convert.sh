#!/bin/bash
red='\033[0;31m'
green='\033[0;32m' 
normal='\033[0m'
echo -n "Enter user > "
read user
echo -n "Enter node > "
read node
if (exec 3<>/dev/tcp/$node/22) 2> /dev/null; then
	echo -en "${green}[OK]${normal} \n"
	echo -n "Enter storage > " 
	read storage
	echo -n "Enter export directory > "
	read folder
elif (ssh $user@$storage 'test -d '/$folder''); then
	echo -e "${green}[OK]${normal} "
	echo -n "Enter interface virtual machine > "
	read iface
	echo -n "Enter virtual machine name >"
	read vmName

echo -e "virt-v2v -ic qemu+ssh://${green}$user${normal}@${green}$node${normal}/system -o rhev -os ${green}$storage${normal}:/${green}$folder${normal} --network ${green}$iface${normal} ${green}$vmName${normal}"
tput sgr0
echo -n "Continue? (y/n) "
else 
	echo -e "${red}[FAIL]${normal}"
fi
read item
case "$item" in
		y|Y);;
		*|n|N) exit 0;;
	esac
virt-v2v -ic qemu+ssh://$user@$node/system -o rhev -os $storage:/$folder --network $iface $vmName
