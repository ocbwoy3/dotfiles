# OCbwoy3's Dotfiles

![rice](https://media.discordapp.net/attachments/1097243689522311319/1282796243990614016/image.png?ex=66e0a899&is=66df5719&hm=6034fe498ed067c43549144305eade7b1aa62333f40e4d246ef05a08a4c6fcc1&)

This is my Hyprland configuration for NixOS.

Currently includes: Hyprland, Waybar, WLogout, Alacritty. This also comes pre-installed with Discord, Roblox and PulseAudio.

Some apps will be displayed in Latvian by default, timezone will be set to `Europe/Riga`, user is `ocbwoy3`.
NVIDIA Drivers are installed too!

***If you used OCbwoy3's dotfiles before this branch got merged, you have to switch it manually with `git branch nix`!!!***

To get started, in your home directory, clone this repo, then replace your `configuration.nix` with the provided here, rebuild your config, then reboot. Then, run `bash dotfiles/scripts/install.sh`. **If you cannot access the terminal after rebooting, press `CTRL+ALT+F5`!!!**

This rice *mostly* uses the Catppuccin Mocha color pallete. The Discord theme is [system24](https://github.com/refact0r/system24).

## Keybindings

Usually what you expect with the default Hyprland config, `SUPER+Q`, `SUPPER+ArrowUp`, `SUPER+C`, etc.
However, some things are different.

idk how tables work in markdown, i tried my fuckin best to make this look good

| Keybind             | What it does     |
|---------------------|------------------|
| `SUPER+T`           | App Launcher     |
| `SUPER+SHIFT+ENTER` | Change wallpaper |
| `SUPER+F1`          | Fake Fullscreen  |
| `SUPER+F2`          | Roblox           |
| `SUPER+Space`       | Keyboard Layout  |