#!/bin/bash

# Checking whether script is being run as root

if [[ ${UID} != 0 ]]; then
    echo "${red}
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi

echo -e "
\e[32m#############################
#     Updating Data Base    #
#############################\e[0m
"
sudo apt update

echo -e "
\e[32m##############################
# Upgrading Operating System #
##############################\e[0m
"
sudo apt upgrade -y


echo -e "
\e[32m##################################################
# Clean partial packages #
##################################################\e[0m
"
sudo apt autoclean -y

echo -e "
\e[32m##################################################
# Clean up any unwanted packages from the System #
##################################################\e[0m
"
sudo apt autoremove -y

echo -e "
\e[32m##################################################
# Auto cleanup apt-cache #
##################################################\e[0m
"
sudo apt clean -y


echo -e "
\e[32m##############################
#   Updating Snap packages   #
##############################\e[0m
"
sudo snap refresh

echo -e "
\e[32m#################################
#   Updating Flatpak packages   #
#################################\e[0m
"
sudo flatpak update -y


echo "done!"