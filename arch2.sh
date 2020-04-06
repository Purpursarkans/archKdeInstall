#!/bin/bash

hostname=$(cat hostname.txt)
username=$(cat username.txt)

pacman -S nano vim --noconfirm
loadkeys ru
setfont cyr-sun16
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
export LANG=ru_RU.UTF-8
echo -e "KEYMAP=ru\nFONT=cyr-sun16" >> /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Europe/Saratov /etc/localtime
hwclock --systohc
echo $hostname >> /etc/hostname
echo -e "127.0.0.1	localhost\n::1			localhost\n127.0.1.1	potato-pc.localdomain	potato-pc" >> /etc/hosts 
useradd -G wheel -s /bin/bash -m $username
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers1
cat /etc/sudoers >> /etc/sudoers1
mv /etc/sudoers1 /etc/sudoers
pacman -S  efibootmgr iw wpa_supplicant dialog netctl dhcpcd --noconfirm
bootctl install
echo -e "default arch\ntimeout 0\neditor 1" >> /boot/loader/loader.conf
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /boot/loader/entries/arch.conf

pacman -S xorg-server xorg-xinit --noconfirm
echo "exec startkde" > ~/.xinitrc
pacman -S plasma --noconfirm

echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Suy gwenview kimageformats kipi-plugins kamera konsole dolphin firefox kate ark aspell-ru telegram-desktop spectacle gimp htop steam pulseaudio-alsa lib32-alsa-plugins lib32-libpulse alsa-utils simplescreenrecorder discord fasm --noconfirm

pacman -Rs discover --noconfirm

pacman -S xf86-video-ati mesa lib32-mesa mesa-vdpau lib32-mesa-vdpau --noconfirm
pacman -S earlyoom neofetch kdekonnect mpv p7zip virtualbox virtualbox-host-modules-arch blender krita audacity kdevelop cmake qbittorrent inkscape --noconfirm
modprobe vboxdrv
pacman -S dkms virtualbox-guest-utils virtualbox-guest-modules-arch --noconfirm

systemctl enable earlyoom
systemctl enable sddm
systemctl enable NetworkManager
cd ~
echo "export EDITOR=nano" >> .bashrc
clear
echo "Enter password for root"
passwd
echo "Enter password for $username"
passwd $username

exit
