#!/bin/bash if [ -f /nfs-share ]; then  mkdir /nfs-share; else echo folder exists; figrep nfs-share /etc/fstabif [ $? == 0 ]; then echo fstab already has entry; else echo "192.168.100.13:/nfs-share /nfs-share nfs auto,nofail,noatime,nolock,intr,tcp 0 0" >>/etc/fstab; fimount -adf -hexit#!/bin/bash

 if [ -f /nfs-share ]; then  mkdir /nfs-share; else echo folder exists; fi

grep nfs-share /etc/fstab
if [ $? == 0 ]; then echo fstab already has entry; else echo "192.168.100.13:/nfs-share /nfs-share nfs auto,nofail,noatime,nolock,intr,tcp 0 0" >>/etc/fstab; fi

mount -a
df -h
exit
