#!/usr/bin/python3

import json
from os import popen
from sys import stdout
from time import sleep

def cmd(command) -> str:
	with popen(command) as process:
		return process.read()[0:-1]

def update():
	try:
		activeWindowTitle = f"🖥️ {json.loads(cmd("hyprctl activewindow -j"))['title']}"
	except Exception as ex:
		activeWindowTitle = "🖥️ Hyprland"

	try:
		songTitle = cmd("playerctl metadata title -s")
		albumName = cmd("playerctl metadata album -s")
		if len(albumName) > 0:
			albumName = f" | {albumName}"
		else:
			albumName = ""
		if len(songTitle) > 0:
			currentSong = f"🎵 {songTitle} {albumName}"
		else:
			currentSong = "💾 OCbwoy3's Dotfiles"
	except Exception as ex:
		currentSong = str(ex)

	

	return [
		{
			'application_id': 1274405561953292339,
			'state': activeWindowTitle,
			'details': currentSong, 
			'large_image': {'key': 'archlinux', 'text': 'Arch Linux'},
			'small_image': {'key': 'hyprland', 'text': 'Hyprland'},
			'start_timestamp': int(cmd('date -d "$(uptime -s)" +%s')),
			'end_timestamp': None,
			'buttons': [],
			'party': None,
		}
	]

while True:
	print(json.dumps(update()))

	stdout.flush()

	sleep(2)