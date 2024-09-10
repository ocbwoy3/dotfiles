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


| Keybind   | What it does         |
|-----------|----------------------|
| `SUPER+Q` | Terminal             |
| `SUPER+C` | Close current window |
| `SUPER+E` | File Manager         |
| `SUPER+V` | Toggle Floating      |
| `SUPER+Q` | Terminal             |
| `SUPER+T` | App Launcher         |
| `SUPER+P` | Psuedo               |
| `SUPER+J` | Toggle Split         |
| `SUPER+F` | Fullscreen           |

| Keybind            | What it does       |
|--------------------|--------------------|
| `SUPER+RightArrow` | Move Focus (right) |
| `SUPER+LeftArrow`  | Move Focus (left)  |
| `SUPER+DownArrow`  | Move Focus (down)  |
| `SUPER+UpArrow`    | Move Focus (up)    |

| Keybind                  | What it does  |
|--------------------------|---------------|
| `SUPER+SHIFT+RightArrow` | Width +100    |
| `SUPER+SHIFT+LeftArrow`  | Width -100    |
| `SUPER+SHIFT+DownArrow`  | Height +100   |
| `SUPER+SHIFT+UpArrow`    | Height -100   |

| Keybind                 | What it does            |
|-------------------------|-------------------------|
| `SUPER+CTRL+RightArrow` | Swap Window Pos (right) |
| `SUPER+CTRL+LeftArrow`  | Swap Window Pos (left)  |
| `SUPER+CTRL+UpArrow`    | Swap Window Pos (down)  |
| `SUPER+CTRL+DownArrow`  | Swap Window Pos (up)    |

| Mouse Keybind      | What it does   |
|--------------------|----------------|
| `SUPER+MouseLeft`  | Move Window    |
| `SUPER+MouseRight` | Resize Window  |
| `SUPER+ScrollUp`   | Next Workspace |
| `SUPER+ScrollDown` | Prev Workspace |

| Keybind   | What it does                             |
|-----------|------------------------------------------|
| `SUPER+1` | Switch to workspace 1                    |
| `SUPER+2` | Switch to workspace 2                    |
| `SUPER+3` | Switch to workspace 3                    |
| `SUPER+4` | Switch to workspace 4                    |
| `SUPER+5` | Switch to workspace 5                    |
| `SUPER+6` | Switch to workspace 6                    |
| `SUPER+7` | Switch to workspace 7                    |
| `SUPER+8` | Switch to workspace 8                    |
| `SUPER+9` | Switch to workspace 9                    |
| `SUPER+0` | Switch to workspace 10                   |
| `SUPER+SHIFT+1` | Move active window to workspace 1  |
| `SUPER+SHIFT+2` | Move active window to workspace 2  |
| `SUPER+SHIFT+3` | Move active window to workspace 3  |
| `SUPER+SHIFT+4` | Move active window to workspace 4  |
| `SUPER+SHIFT+5` | Move active window to workspace 5  |
| `SUPER+SHIFT+6` | Move active window to workspace 6  |
| `SUPER+SHIFT+7` | Move active window to workspace 7  |
| `SUPER+SHIFT+8` | Move active window to workspace 8  |
| `SUPER+SHIFT+9` | Move active window to workspace 9  |
| `SUPER+SHIFT+0` | Move active window to workspace 10 |

| Keybind         | What it does                             |
|-----------------|------------------------------------------|
| `SUPER+Z`       | Special Workspace                        |
| `SUPER+SHIFT+Z` | Move current window to special Workspace |
| `SUPER+SHIFT+B` | Reload Waybar                            |
| `SUPER+SHIFT+B` | Reload Waybar                            |
| `CTRL+ALT+DEL`  | WLogout                                  |
| `FN+F1`         | Steam Flatpak                            |

| Keybind             | What it does                                                    |
|---------------------|-----------------------------------------------------------------|
| `SUPER+SHIFT+ENTER` | Change wallpaper                                                |
| `SUPER+F1`          | Fake Fullscreen (Roblox)                                        |
| `SUPER+F2`          | [Roblox](https://github.com/ocbwoy3/sober-bloxstraprpc-wrapper) |
| `SUPER+Space`       | Switch Keyboard Layout (English, Latvian)                       |