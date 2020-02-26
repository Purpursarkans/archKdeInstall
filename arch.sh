#!/bin/bash

echo "!!!write all the names together (don't use space)!!!"
echo "!!!dont use special symbol (example: _ $ * . , ! # & ? ; : ( ) and other(can only "-" (hyphen)))!!!"
read -p "Enter username (on eng)(example: igorek): " username
read -p "Enter hostname (on eng)(example: potato-pc): " hostname
read -p "Enter swap size (on num)(example: 8): " swap


echo $username >> username.txt
echo $hostname >> hostname.txt

add=+
g=G
swap=(${add}${swap}${g})

(
  echo g;
  echo n;
  echo 1;
  echo;
  echo +100m;
  echo t;
  echo 1;
  echo n;
  echo 2;
  echo;
  echo $swap;
  echo t;
  echo 2;
  echo 19;
  echo n;
  echo 3;
  echo;
  echo;
  echo w;
) | fdisk /dev/sda
mkfs.ext4 /dev/sda3 -L "Arch Linux"
mount /dev/sda3 /mnt
mkfs.fat /dev/sda1
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
mkswap /dev/sda2 -L "swap"
swapon /dev/sda2
echo -e "#Russia\nServer = https://mirror.rol.ru/archlinux/\$repo/os/\$arch\nServer = https://mirror.yandex.ru/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist1
cat /etc/pacman.d/mirrorlist >> /etc/pacman.d/mirrorlist1
mv /etc/pacman.d/mirrorlist1 /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap /mnt base linux linux-firmware base-devel wget
genfstab -L -p -P /mnt >> /mnt/etc/fstab
arch-chroot /mnt wget git.io/JexzX

mv username.txt /mnt
mv hostname.txt /mnt

arch-chroot /mnt sh JexzX
umount -R /mnt
clear
echo "end install"
echo "end install"
echo "end install"
echo "turn off pc and disconnect the disk with archlinux"
echo "auto shutdown via 5 minute"
shutdown +5
