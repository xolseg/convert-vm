#!/bin/bash

virt-vv -ic qemu+ssh://$user@$host/system -o rhev -os $storage:/$folder --network $iface $vmName
