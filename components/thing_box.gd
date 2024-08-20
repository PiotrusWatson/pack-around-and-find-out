extends Node3D

func _process(delta):
	if holding_something():
		get_thing().global_position = global_position
func holding_something():
	return get_child_count() == 1

func hold(thing):
	thing.reparent(self)
	
func release(thing):
	thing.reparent(get_tree().root)

func get_thing():
	if !holding_something():
		return null
	return get_child(0)
