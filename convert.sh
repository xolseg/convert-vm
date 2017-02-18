#!/bin/bash

green='\033[0;32m' 
normal='\033[0m'
echo -n "Enter user > "
read user
echo -n "Enter host(fqnd) > "
read host
echo -n "Enter storage(fqnd) > "
read storage
echo -n "Enter folder(export storage) > "
read folder
echo -n "Enter interface > "
read iface
echo -n "Enter virtualmachine name > "
read vmName

echo -e "virt-v2v -ic qemu+ssh://${green}$user${normal}@${green}$host${normal}/system -o rhev -os ${green}$storage${normal}:/${green}$folder${normal} --network ${green}$iface${normal} ${green}$vmName${normal}"
tput sgr0
echo -n "Continue? (y/n) "

read item
case "$item" in
		y|Y);;
		*|n|N) exit 0;;
	esac
virt-v2v -ic qemu+ssh://$user@$host/system -o rhev -os $storage:/$folder --network $iface $vmName
