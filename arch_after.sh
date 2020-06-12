#!/bin/bash

yay -S minecraft-launcher amidst aseprite magicavoxel logmein-hamachi corectrl
sudo systemctl enable --now logmein-hamachi
sudo hamachi login
sudo hamachi set-nick "уточка"
(
echo;
) | sudo hamachi join 403-695-568
