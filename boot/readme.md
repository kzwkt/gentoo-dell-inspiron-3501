using systemd boot/hummiboot 

nano gentoo.conf
title Gentoo
efi     gentoo.efi
options root=/dev/nvme0n1p2 rw quiet
