#https://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3.txt
mp=/mnt
url=$(curl -s https://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3-amd64-nomultilib-openrc.txt | grep -oP '^\d{8}T\d{6}Z/.*\.tar\.xz')
filen="${url##*/}"
wget --no-clobber https://distfiles.gentoo.org/releases/amd64/autobuilds/"$url"

 tar xpf $filen --xattrs-include='*.*' --numeric-owner -C "$mp"


gentoo-chroot() {
  cp -L /etc/resolv.conf "$mp"/etc/resolv.conf
  mount --rbind /dev "$mp"/dev && mount --make-rslave "$mp"/dev
  mount --rbind /dev/pts "$mp"/dev/pts && mount --make-rslave "$mp"/dev/pts
  mount --rbind /proc "$mp"/proc && mount --make-rslave "$mp"/proc
  mount --rbind /sys "$mp"/sys && mount --make-rslave "$mp"/sys
}

 gentoo-chroot
chroot "$mp"  bash -i <<EOF
source /etc/profile
export PS1="(chroot) ${PS1}
emerge-webrsync
EOF
