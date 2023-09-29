drives="$(lsblk -npro "name,size,mountpoint,fstype,label"|sed "s/ /:/g" | awk -F':' '$3=="" &&  $4!="" {printf "%s %s %s %s %s\n",$1,$2,$3,$4,$5}')"
sele="$(echo "$drives" | wofi --dmenu | awk '{print $1}')"
set -e
test -n "$sele"
mp="$(find /home/kai/mnt -maxdepth 1 -type d 2>/dev/null | wofi --dmenu)"
test -n "$mp"
sudo -A mount "$sele" $mp
