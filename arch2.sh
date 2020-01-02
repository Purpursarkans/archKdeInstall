#!/bin/bash

echo pacman -S nano neofetch screenfetch mc --noconfirm
echo loadkeys ru
echo setfont cyr-sun16
echo echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> nano /etc/locale.gen
echo locale-gen
echo echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo export LANG=ru_RU.UTF-8
echo echo -e "KEYMAP=ru\nFONT=cyr-sun16" >> /etc/vconsole.conf
echo ln -sf /usr/share/zoneinfo/Europe/Saratov /etc/localtime
echo hwclock --systohc
echo echo "potato-pc" >> /etc/hostname
echo echo -e "127.0.0.1	localhost\n::1			localhost\n127.0.1.1	potato-pc.localdomain	potato-pc" >> /etc/hosts 
echo useradd -G wheel -s /bin/bash -m igorek
echo echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers1
echo cat /etc/sudoers >> /etc/sudoers1
echo mv /etc/sudoers1 /etc/sudoers
echo rm /etc/sudoers1
echo passwd
echo passwd igorek
echo pacman -S  efibootmgr iw wpa_supplicant dialog netctl dhcpcd --noconfirm
#echo pacman -S networkmanager network-manager-applet ppp --noconfirm
echo bootctl install
echo echo -e "default arch\ntimeout 5\neditor 1" >> /boot/loader/loader.conf
echo echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /boot/loader/entries/arch.conf