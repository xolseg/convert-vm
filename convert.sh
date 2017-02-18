#!/bin/bash

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


echo "virt-v2v -ic qemu+ssh://$user@$host/system -o rhev -os $storage:/$folder --network $iface $vmName"
echo -n "Continue? (y/n) "

read item
case "$item" in
		y|Y);;
		*|n|N) exit 0;;
	esac
virt-v2v -ic qemu+ssh://$user@$host/system -o rhev -os $storage:/$folder --network $iface $vmName
