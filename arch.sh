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
rm /etc/pacman.d/mirrorlist1
pacman -Syy
pacstrap /mnt base linux linux-firmware base-devel
genfstab -L -p -P /mnt >> /mnt/etc/fstab
arch-chroot /mnt 
pacman -S nano neofetch screenfetch mc
loadkeys ru
setfont cyr-sun16
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> nano /etc/locale.gen
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
rm /etc/sudoers1
passwd
passwd igorek
pacman -S  efibootmgr iw wpa_supplicant dialog netctl dhcpcd
bootctl install
echo -e "default arch\ntimeout 5\neditor 1" >> /boot/loader/loader.conf
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3 rw" >> /boot/loader/entries/arch.conf