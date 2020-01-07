#!/bin/bash

pacman -S nano neofetch --noconfirm
loadkeys ru
setfont cyr-sun16
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
export LANG=ru_RU.UTF-8
echo -e "KEYMAP=ru\nFONT=cyr-sun16" >> /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Europe/Saratov /etc/localtime
hwclock --systohc
echo "potato-pc" >> /etc/hostname
echo -e "127.0.0.1	localhost\n::1			localhost\n127.0.1.1	potato-pc.localdomain	potato-pc" >> /etc/hosts 
useradd -G wheel -s /bin/bash -m igorek
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers1
cat /etc/sudoers >> /etc/sudoers1
mv /etc/sudoers1 /etc/sudoers
pacman -S  efibootmgr iw wpa_supplicant dialog netctl dhcpcd --noconfirm
systemctl enable NetworkManager
bootctl install
echo -e "default arch\ntimeout 5\neditor 1" >> /boot/loader/loader.conf
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /boot/loader/entries/arch.conf
clear
echo "Введите пароль для рута"
passwd
echo "Введите пароль для пользователя"
passwd igorek
