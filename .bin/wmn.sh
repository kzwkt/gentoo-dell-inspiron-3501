drives="$(lsblk -npro "name,size,mountpoint,fstype,label"|sed "s/ /:/g" | awk -F: '$3=="" &&  $4!="" {printf "%s %s %s %s %s\n",$1,$2,$3,$4,$5}')"
sele="$(echo "$drives" | wofi -i --dmenu -p "mount which drive?" --width 20% --height=25% | awk '{print $1}')"
set -e
test -n "$sele"
mp="$(find /home/kai/mnt -maxdepth 1 -type d 2>/dev/null | wofi -i --dmenu -p "mount in" --width 25% --height=20% )"
test -n "$mp"
sudo -A mount "$sele" $mp
