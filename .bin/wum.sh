#!/bin/sh

#drives="$(lsblk -nrpo "name,type,size,mountpoint,label" | awk -F':' '{gsub(/ /,":")}$4!~/\/boot|\/efi|\/home$|SWAP/&&length($4)>1{printf "%s (%s) %s\n",$4,$3,$5}'; awk '/simple-mtpfs/ { print "📱", $2; }' /etc/mtab)"
drives="$(grep /home/kai/mnt  /etc/mtab | cut -f 2 -d ' ')"

chosen="$(echo "$drives" |wofi --dmenu -i -p "Unmount which drive?")" || exit 1

case "$chosen" in
	*)
		chosen="${chosen% (*}"
		sudo -A umount -l "$chosen"
		;;
esac 
