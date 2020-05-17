#!/bin/bash

IFS=' '

pkgs="vim gcc make git net-tools tmux openssh-server"
read -ra pkg_arr <<< "$pkgs"

echo "The following packages will be installed using apt:"
for i in "${pkg_arr[@]}"; do
    echo $i
done

read -p "Do you wish to proceed?(y/n)" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    sudo apt update
    sudo apt upgrade
    sudo apt install $pkgs
fi
