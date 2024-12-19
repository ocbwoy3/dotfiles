#!/usr/bin/python3

import json, re
from os import popen
from sys import stdout
from time import sleep

import pypresence
client = pypresence.Client(client_id=1296541815851192370)

def cmd(command) -> str:
	with popen(command) as process:
		return process.read()[0:-1]

hyprland_version = cmd("hyprctl version -j | jq .tag").replace('\"','')
nixos_version = cmd("nixos-version")
nixos_version_simple = re.search('^([0-9]+\.?([0-9]+)?(pre)?)',nixos_version)[0] + " (" + re.search('\([A-Za-z0-9]+\)$',nixos_version)[0].replace("(","").replace(")","") + ")"

def update():

	client.set_activity(
		pid = 1,
		state = f"Hyprland {hyprland_version}",
		details = f"NixOS {nixos_version_simple}",
		large_image = "nixos",
		large_text = "NixOS",
		small_image = "https://avatars.githubusercontent.com/u/107882187",
		small_text = "Hyprland"
	)

client.start()

try:
	while True:
		
		update()
		sleep(1)
except:
	client.close()
