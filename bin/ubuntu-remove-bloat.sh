#!/bin/bash

# Remove games and other bloat
sudo apt remove aisleriot brltty gnome-mahjongg gnome-mines gnome-sudoku gnome-todo rhythmbox shotwell totem

# Disable error popups /var/crash/*
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# apt list --installed | awk -F'/' '{print $1}'