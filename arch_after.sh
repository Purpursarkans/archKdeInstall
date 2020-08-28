#!/bin/bash

yay -S minecraft-launcher amidst aseprite magicavoxel logmein-hamachi corectrl cpupower-gui radeontop wd719x-firmware aic94xx-firmware --noconfirm
sudo systemctl enable --now logmein-hamachi
sudo hamachi login
sudo hamachi set-nick "уточка"
(
echo;
) | sudo hamachi join 403-695-568
