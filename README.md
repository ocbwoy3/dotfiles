This is my attempt at ricing Hyprland. (wip)

![Preview](https://cdn.ocbwoy3.dev/assets/rice.png)

- [ ] Rice
    - [x] Hyprland
    - [x] Waybar
    - [x] Alacritty
    - [ ] Hyprlock
    - [ ] Hyprpaper
    - [ ] GTK
    - [ ] ZSH (Moving away from bash)
- [ ] Features
    - [x] Screenshot script
    - [ ] Installer script
    - [ ] Customization app
    - [ ] Probably a bunch more features

# How to set up:

1. Install:

    - hyprland
    - hyprpaper
    - hyprlock
    - xdg-desktop-portal-hyprland
    - waybar
    - playerctl
    - grim
    - xclip
    - dunst
    - polkit (polkit-gnome-authentication-agent-1)
    - wl-paste
    - libnotify
    - nerd fonts
    - brightnessctl
    - pulseaudio
    - pactl
    - alacritty
    - gtk
    - monaspace fonts
    - pipewire
    - wireplumber
    - nautilus
    - rofi

2. Git clone this repository into `~/dotfiles`
3. Delete `~/.config/hypr` and `~/.config/alacritty` and `.config/waybar`
4. Make symlinks for folders from `~/dotfiles/` into `~/.config/` (like `~/dotfiles/hypr` -> `~/.config/hypr`)
