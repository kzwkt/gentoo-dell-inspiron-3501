
emerge-webrsync
eselect news read 

emerge app-portage/cpuid2cpuflags
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags

emerge --ask --verbose --update --deep --newuse @world

ln -s /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime


nano /etc/locale.gen
en_US.UTF-8 UTF-8
locale-gen

emerge -a gentoolkit eix  eselect-repository  dev-vcs/git  
rm -r /var/db/repos/gentoo
eselect repository enable gentoo
emerge --sync


emerge -a iwd


features FEATURES="noman nodoc noinfo"
-man use flag 
