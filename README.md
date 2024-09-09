# OCbwoy3's Dotfiles

This is my Hyprland configuration for NixOS.

Some apps will be displayed in Latvian by default, timezone will be set to `Europe/Riga`, user is `ocbwoy3`.
Roblox and Vesktop will be installed by default.

***If you used OCbwoy3's dotfiles before this branch got merged, you have to switch it manually with `git branch nix`!!!***

To get started, in your home directory, clone this repo, then replace your `configuration.nix` with the provided here, rebuild your config, then reboot. Then, run `bash dotfiles/scripts/install.sh`. **If you cannot access the terminal after rebooting, press `CTRL+ALT+F5`!!!**

This rice *mostly* uses the Catppuccin Mocha color pallete. The Discord theme is [system24](https://github.com/refact0r/system24).

## Keybindings

Usually what you expect with the default Hyprland config, `SUPER+Q`, `SUPPER+ArrowUp`, `SUPER+C`, etc.
However, some things are different.

`SUPER+T` - App Launcher
`SUPER+SHIFT+ENTER` - Switch wallpapers
`SUPER+F1` - Fake Fullscreen (Roblox)
`SUPER+F2` - Launch Roblox via [the wrapper provided](https://github.com/ocbwoy3/sober-bloxstraprpc-wrapper)