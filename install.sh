#https://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3.txt
mp=/mnt
url=$(curl -s https://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3-amd64-nomultilib-openrc.txt | grep -oP '^\d{8}T\d{6}Z/.*\.tar\.xz')
filen="${url##*/}"
wget --no-clobber https://distfiles.gentoo.org/releases/amd64/autobuilds/"$url"

 tar xpf $filen --xattrs-include='*.*' --numeric-owner -C "$mp"


gentoo-chroot() {
  mount --bind /etc/resolv.conf /"$mp"/etc/resolv.conf
  mount --rbind /dev /mnt/dev && mount --make-rslave /"$mp"/dev
  mount --rbind /dev/pts /"$mp"/dev/pts && mount --make-rslave /"$mp"/dev/pts
  mount --rbind /proc /"$mp"/proc && mount --make-rslave /mnt/proc
  mount --rbind /sys /"$mp"/sys && mount --make-rslave /"$mp"/sys
}

 gentoo-chroot
source /etc/profile
export PS1="(chroot) ${PS1}

