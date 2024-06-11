#!/usr/bin/env bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################


echo
tput setaf 2
echo "################################################################"
echo "################### Copy over config and build"
echo "################################################################"
tput sgr0
echo

if [[ ! -d $HOME/Documents/GitHub/ ]]; then
    mkdir -p $HOME/Documents/GitHub/
fi

if [[ ! -d $HOME/Documents/GitHub//suckless ]]; then
    cd $HOME/Documents/GitHub/ && git clone https://github.com/yousseffjel/suckless.git
fi

if [[ ! -d $HOME/Documents/GitHub/bin ]]; then
    cd $HOME/Documents/GitHub/ && git clone https://github.com/yousseffjel/bin.git
fi


sudo cp -vf *.nix /etc/nixos/
sudo cp -vrf desktops /etc/nixos/

sudo nixos-rebuild switch

echo
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

