#!/bin/bash

(
  echo g;
  echo n;
  echo 1;
  echo;
  echo +200m;
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
pacstrap /mnt base linux linux-firmware base-devel wget
genfstab -L -p -P /mnt >> /mnt/etc/fstab
arch-chroot /mnt wget git.io/JexzX 
arch-chroot /mnt sh JexzX
umount -R /mnt
echo "end"
