#!/bin/bash

CWD=$(pwd)

_symlink() {
    name="$1"
    llink="$2";
    lsource="$3";
    ltarget="$4";
    
    if [ -L "${llink}" ]; then
        rm ${llink}
        ln -s ${lsource} ${ltarget} 
        echo "Symlinked: ${lsource} -> ${ltarget}/${name}"
    else
        if [ -d ${llink} ]; then
            rm -rf ${llink}/ 
            ln -s ${lsource} ${ltarget}
            echo "Symlinked directory: ${lsource} -> ${ltarget}/${name}"
        else
            if [ -f ${llink} ]; then
                rm ${llink} 
                ln -s ${lsource} ${ltarget} 
                echo "Symlinked file: ${lsource} -> ${ltarget}/${name}"
            else
                ln -s ${lsource} ${ltarget} 
                echo "Symlinked: ${lsource} -> ${ltarget}/${name}"
            fi
        fi
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

_installDependencies() {
	
	sudo chmod +x $HOME/dotfiles/scripts/rich-presence.py

    # automatically installs sober-bloxstraprpc-wrapper for you.

    mkdir $HOME/Projects
    cd $HOME/Projects
    git clone https://github.com/ocbwoy3/sober-bloxstraprpc-wrapper
    cd $HOME/Projects/sober-bloxstraprpc-wrapper
    npm i
    
	flatpak install --user https://sober.vinegarhq.org/sober.flatpakref
	flatpak install dev.vencord.Vesktop

}

_setSymlinks() {
	cd $HOME/.config

	_symlink alacritty ~/.config/alacritty $HOME/dotfiles/alacritty ~/.config
	_symlink hypr ~/.config/hypr $HOME/dotfiles/hypr ~/.config
	_symlink waybar ~/.config/waybar $HOME/dotfiles/waybar ~/.config
	_symlink dunst ~/.config/dunst $HOME/dotfiles/dunst ~/.config

	cd $CWD

}

_gitCloneWallpaperRepo
_setSymlinks
_installDependencies

echo "OCbwoy3's Dotfiles have been successfully installed. Rebuild your config, then reboot."