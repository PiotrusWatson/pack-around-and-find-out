extends Node

@onready var main_song = preload("res://sound/music/JohnTyTune144_E.mp3")
@onready var menu_song = preload("res://sound/music/DoseANova76_D.mp3")
# Called when the node enters the scene tree for the first time.
@onready var menu_player = $MenuPlayer
@onready var game_player = $GamePlayer

func play_menu():
	if menu_player.playing:
		return
	if game_player.playing:
		game_player.stop()
	menu_player.stream = menu_song
	menu_player.play()

func play_main():
	if menu_player.playing:
		menu_player.stop()
	game_player.stream = main_song
	game_player.play()
