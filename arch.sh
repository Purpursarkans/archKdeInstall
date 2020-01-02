#!/bin/bash

(
  echo g;
  echo n;
  echo 1;
  echo;
  echo +1G;
  echo t;
  echo 1;
  echo n;
  echo 2;
  echo;
  echo +8G;
  echo t;
  echo 2;
  echo 19;
  echo n;
  echo 3;
  echo;
  echo;
  echo w;
) | fdisk /dev/sda
mkfs.ext4 /dev/sda3 -L "Arch"
mount /dev/sda3 /mnt
mkfs.fat /dev/sda1
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
mkswap /dev/sda2 -L "swap"
swapon /dev/sda2
echo -e "#Russia\nServer = https://mirror.rol.ru/archlinux/\$repo/os/\$arch\nServer = https://mirror.yandex.ru/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist1
cat /etc/pacman.d/mirrorlist >> /etc/pacman.d/mirrorlist1
mv /etc/pacman.d/mirrorlist1 /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap /mnt base linux linux-firmware base-devel
genfstab -L -p -P /mnt >> /mnt/etc/fstab
(
echo pacman -S nano neofetch screenfetch mc --noconfirm
echo loadkeys ru
echo setfont cyr-sun16
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /mnt/etc/locale.gen
echo locale-gen
echo "LANG=ru_RU.UTF-8" >> /mnt/etc/locale.conf
echo export LANG=ru_RU.UTF-8
echo -e "KEYMAP=ru\nFONT=cyr-sun16" >> /mnt/etc/vconsole.conf
echo ln -sf /mnt/usr/share/zoneinfo/Europe/Saratov /mnt/etc/localtime
echo hwclock --systohc
echo "potato-pc" >> /mnt/etc/hostname
echo -e "127.0.0.1	localhost\n::1			localhost\n127.0.1.1	potato-pc.localdomain	potato-pc" >> /mnt/etc/hosts 
echo useradd -G wheel -s /mnt/bin/bash -m igorek
echo "%wheel ALL=(ALL) ALL" >> /mnt/etc/sudoers1
echo cat /mnt/etc/sudoers >> /mnt/etc/sudoers1
echo mv /mnt/etc/sudoers1 /mnt/etc/sudoers
echo passwd
echo Lapochka01
echo Lapochka01
echo passwd igorek
echo Lapochka01
echo Lapochka01
echo pacman -S efibootmgr iw wpa_supplicant dialog netctl dhcpcd --noconfirm
echo pacman -S networkmanager network-manager-applet ppp --noconfirm
echo bootctl install
) | arch-chroot /mnt
(
echo -e "default arch\ntimeout 5\neditor 1" >> /mnt/boot/loader/loader.conf
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /mnt/boot/loader/entries/arch.conf
) | arch-chroot /mnt



umount -R /mnt
echo "end"