# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
		];

	boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		recognitionType = "magic";
		offset = 0;
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
	};

	# Bootloader.
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
		};
		grub = {
			efiSupport = true;
			device = "nodev";
		};
	};

	# boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_1;

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Riga";

	# Select internationalisation properties.
	i18n.defaultLocale = "lv_LV.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "lv_LV.UTF-8";
		LC_IDENTIFICATION = "lv_LV.UTF-8";
		LC_MEASUREMENT = "lv_LV.UTF-8";
		LC_MONETARY = "lv_LV.UTF-8";
		LC_NAME = "lv_LV.UTF-8";
		LC_NUMERIC = "lv_LV.UTF-8";
		LC_PAPER = "lv_LV.UTF-8";
		LC_TELEPHONE = "lv_LV.UTF-8";
		LC_TIME = "lv_LV.UTF-8";
	};

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	programs.hyprland = {
		# Install the packages from nixpkgs
		enable = true;
		# Whether to enable XWayland
		xwayland.enable = true;
	};
	# hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

	hardware.opengl = {
		enable = true;
	};
	# hardware.pulseaudio.enable = true;
	hardware.bluetooth.enable = true;
	services.xserver.enable = true;
	services.xserver.videoDrivers = ["nvidia"];
	services.displayManager.sddm = {
		enable = true;
		theme = "catppuccin-mocha";
		package = pkgs.kdePackages.sddm;
		# xwayland.enable = true;
	};
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;
	};
	
	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		package = config.boot.kernelPackages.nvidiaPackages.latest;
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.ocbwoy3 = {
		isNormalUser = true;
		description = "OCbwoy3";
		extraGroups = [ "networkmanager" "wheel" "input" ];
		packages = with pkgs; [
			brave
			alacritty
			prismlauncher
			gimp
		];
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	programs.gamemode.enable = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		catppuccin-sddm
		vim
		gnome.nautilus
		qpwgraph
		wget
		git
		neofetch
		vscode
		nodejs
		python3
		wofi
		waybar
		dunst
		hyprlock
		swww
		swappy
		slurp
		grim
		wl-clipboard
		pywal
		pavucontrol
		polkit
		polkit-kde-agent
		wlogout
		libnotify
		killall
		networkmanagerapplet
		blueman
		arrpc
		playerctl
		vinegar
	];

	fonts.packages = with pkgs; [
		monaspace
		nerdfonts
	];

	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt minizip nss re2 snappy libnotify libappindicator-gtk3
	];

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	services.flatpak.enable = true;

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#	 enable = true;
	#	 enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?

}

