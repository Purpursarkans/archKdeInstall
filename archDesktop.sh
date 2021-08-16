#!/bin/bash

hostname=$(cat hostname.txt)
username=$(cat username.txt)

echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Suuyy kscreen codeblocks git kdenlive opencv sshfs xf86-video-amdgpu vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver vulkan-mesa-layers firefox-i18n-ru progress obs-studio xournalpp man kcm-wacomtablet unrar ttf-roboto noto-fonts noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-dejavu plasma xorg-server xorg-xinit efibootmgr iw wpa_supplicant dialog netctl dhcpcd gwenview kimageformats kipi-plugins kamera konsole dolphin firefox kate ark aspell-ru telegram-desktop flameshot gimp htop steam pulseaudio-alsa lib32-alsa-plugins lib32-libpulse alsa-utils simplescreenrecorder discord fasm xf86-video-ati mesa lib32-mesa mesa-vdpau lib32-mesa-vdpau mesa-demos lib32-mesa-demos earlyoom neofetch kdeconnect mpv p7zip virtualbox virtualbox-host-modules-arch blender krita audacity kdevelop cmake inkscape nano vim --noconfirm

systemctl enable earlyoom
systemctl enable sddm
systemctl enable NetworkManager

pacman -Rs discover --noconfirm

loadkeys ru
setfont cyr-sun16
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo -e "KEYMAP=ru\nFONT=cyr-sun16" >> /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Europe/Saratov /etc/localtime
hwclock --systohc
echo $hostname >> /etc/hostname
echo -e "127.0.0.1	localhost\n::1			localhost\n127.0.1.1	$hostname.localdomain	$hostname" >> /etc/hosts
useradd -G wheel -s /bin/bash -m $username
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers1
cat /etc/sudoers >> /etc/sudoers1
mv /etc/sudoers1 /etc/sudoers

pacman -S grub efibootmgr --needed --noconfirm
grub-install --efi-directory=/boot
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "export EDITOR=nano" >> /home/${username}/.bashrc
clear

mkdir yay
cd yay
git clone https://aur.archlinux.org/yay.git
makepkg -si

echo "Enter password for root"
passwd
echo "Enter password for $username"
passwd $username

rm hostname.txt username.txt JexzX

exit
