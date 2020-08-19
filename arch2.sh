#!/bin/bash

hostname=$(cat hostname.txt)
username=$(cat username.txt)

echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
reflector --verbose --sort rate --save /etc/pacman.d/mirrorlist
pacman -Suuyy sshfs firefox-i18n-ru progress obs-studio xournalpp man kcm-wacomtablet unrar ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-dejavu plasma xorg-server xorg-xinit efibootmgr iw wpa_supplicant dialog netctl dhcpcd gwenview kimageformats kipi-plugins kamera konsole dolphin firefox kate ark aspell-ru telegram-desktop flameshot gimp htop steam pulseaudio-alsa lib32-alsa-plugins lib32-libpulse alsa-utils simplescreenrecorder discord fasm xf86-video-ati mesa lib32-mesa mesa-vdpau lib32-mesa-vdpau mesa-demos lib32-mesa-demos earlyoom neofetch kdeconnect mpv p7zip virtualbox virtualbox-host-modules-arch blender krita audacity kdevelop cmake qbittorrent inkscape nano vim --noconfirm

systemctl enable earlyoom
systemctl enable sddm
systemctl enable NetworkManager

pacman -Rs discover --noconfirm

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
bootctl install
echo -e "default arch\ntimeout 0\neditor 1" >> /boot/loader/loader.conf
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /boot/loader/entries/arch.conf

echo "exec startkde" > ~/.xinitrc


echo "export EDITOR=nano" >> /home/${username}/.bashrc
clear

echo "Enter password for root"
passwd
echo "Enter password for $username"
passwd $username

rm hostname.txt username.txt JexzX

exit
