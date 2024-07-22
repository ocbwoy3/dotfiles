#!/bin/bash

CWD=$(pwd)

_backupPreviousDotfiles() {
	if [[ -d "$HOME/dotfiles" ]]; then
		echo "Found an existing dotfiles folder, backing up."
		sudo cp -r $HOME/dotfiles $HOME/dotfiles_old
		echo "Your current dotfiles have been backed up to $HOME/dotfiles_old"
		read -e -p "Press enter to continue installing... " choice
		sudo rm -rf $HOME/dotfiles
	else
		echo "Could not find dotfiles folder, ignoring backup"
	fi
}

_gitCloneRepo() {
	if [[ -d "$HOME/dotfiles" ]]; then
		echo "Dotfiles folder folder already exists"
	else
		echo "Git cloning the dotfiles"
		git clone https://github.com/ocbwoy3/dotfiles $HOME/dotfiles
	fi
}

_gitCloneWallpaperRepo() {
	if [[ -d "$HOME/wallpaper" ]]; then
		echo "Wallpaper folder folder already exists"
	else
		echo "Git cloning the wallpapers"
		git clone --depth=1 https://github.com/mylinuxforwork/wallpaper $HOME/wallpaper
	fi
}



_installGit() {
	if [[ -f "/usr/bin/git" ]]; then
		echo "Git is already installed"
	else
		echo "Installing git"
		sudo pacman -Syy git
	fi
}

_installYay() {
	if [[ -f "/usr/bin/yay" ]]; then
		echo "Yay is already installed"
	else
		echo "Installing yay"
		git clone https://aur.archlinux.org/yay.git /tmp/.yay_install
		cd /tmp/.yay_install
		sudo makepkg -si
		cd $CWD
		sudo rm -rf /tmp/yay
	fi
}

_installDependencies() {
	sudo pacman -S hyprland hyprpaper hyprlock hyprpaper
	sudo pacman -S alacritty bluez bluez-utils blueman
	sudo pacman -S pulseaudio pulseaudio-bluetooth pavucontrol
	sudo pacman -S wl-clipboard xclip swappy playerctl flatpak
	sudo pacman -S sddm esbuild fuse polkit-gnome swww python-pywal
	sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland

	yay -S wlogout

	flatpak install dev.vencord.Vesktop

	# Configure dependencies after install

	sudo systemctl enable bluetooth.service
	systemctl enable --user pulseaudio.service pulseaudio.socket
	sudo systemctl enable sddm
}

_setSymlinks() {
	cd $HOME/.config

	trap unlink alacritty EXIT
	trap unlink hypr EXIT
	trap unlink ags EXIT
	trap unlink waybar EXIT

	ln -s alacritty $HOME/dotfiles/alacritty
	ln -s hypr $HOME/dotfiles/hypr
	ln -s waybar $HOME/dotfiles/waybar
	ln -s ags $HOME/dotfiles/ags

	cd $CWD

}

_abortInstall() {
	echo "Aborting"
	exit
}

clear
echo "This is the installer script for OCbwoy3's dotfiles."
echo "This will only work in Arch-Based distros which let you install packages from the AUR." 

read -e -p "Do you want to continue? [y/N] > " choice
[[ "$choice" == [Yy]* ]] && echo "" || _abortInstall 

if [ "$EUID" -ne 0 ]; then
	
	clear

	echo "Installing prerequisites"
	_installGit
	_installYay

	clear

	echo "Installing OCbwoy3's dotfiles"
	_backupPreviousDotfiles
	_gitCloneRepo
	
	_gitCloneWallpaperRepo

	clear
	
	echo "Installing dependencies"
	_installDependencies



	echo "OCbwoy3's Dotfiles have been successfully installed. A reboot is recommended."
else
	echo "This script is running with root privileges, please avoid running this as root."
fi

cd $CWD