extends Node

var end_scene = preload("res://worlds/game_end.tscn")
var main_scene = preload("res://worlds/world.tscn")
var title_scene = preload("res://worlds/title.tscn")
var instruction_scene = preload("res://worlds/instructions.tscn")
var credit_scene = preload("res://worlds/credits.tscn")

var max_weight = 0.0
var current_filled_weight = 0.0
var number_of_items = 0

func change_scene(scene):
	get_tree().change_scene_to_packed(scene)
	
func go_to_end():
	change_scene(end_scene)

func go_to_main():
	change_scene(main_scene)
	get_tree().reload_current_scene()
	
func go_to_title():
	change_scene(title_scene)
	
func go_to_credits():
	change_scene(credit_scene)

func go_to_instructions():
	change_scene(instruction_scene)
