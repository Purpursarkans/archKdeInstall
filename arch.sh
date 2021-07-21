#!/bin/bash

clear
echo "!!!write all the names together (don't use space)!!!"
echo "!!!write in small letters!!!"
echo "!!!dont use special symbol (example: _ $ * . , ! # & ? ; : ( ) and other(can only "-" (hyphen)))!!!"

echo "Enter username (on eng)(example: igorek):"
read -p ">>> " username
echo "Enter hostname (on eng)(example: potato-pc):"
read -p ">>> " hostname
echo "Enter swap size (on num)(example: 8G or 512MB):"
read -p ">>> " swap
echo -e "Enter type system:\n1 - Desktop\n2 - Virtualbox: "
read -p ">>> " type

echo $username >> username.txt
echo $hostname >> hostname.txt

add=+
swap=(${add}${swap})

(
  echo g;
  echo n;
  echo 1;
  echo;
  echo +500m;
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
pacman -Syy
pacstrap /mnt base linux linux-firmware base-devel wget
genfstab -L -p -P /mnt >> /mnt/etc/fstab
arch-chroot /mnt wget https://git.io/JlUWm

mv username.txt /mnt
mv hostname.txt /mnt

arch-chroot /mnt sh JlUWm
umount -R /mnt
clear
echo "end install"
echo "end install"
echo "end install"
echo "turn off pc and disconnect the disk with archlinux"
echo "auto shutdown via 5 minute"
shutdown +5
