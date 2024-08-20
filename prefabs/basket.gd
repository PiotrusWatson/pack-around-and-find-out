extends StaticBody3D

var things = {}
signal thing_added(amount)
signal thing_removed(amount)
signal new_weight_added(amount)
signal new_weight_removed(amount)


# Called when the node enters the scene tree for the first time.
func _ready():
	thing_added.emit(things.size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_thing_detector_body_entered(body):
	if !body.is_in_group("things"):
		return
	var thing : Thing = body
	things[body.name] = thing
	thing_added.emit(things.size())
	Globals.number_of_items = things.size()
	new_weight_added.emit(thing.get_weight_from_size())

func _on_thing_detector_body_exited(body):
	if !body.is_in_group("things"):
		return
	var thing : Thing = body
	things.erase(body.name)
	thing_removed.emit(things.size())
	#Globals.number_of_items = things.size()
	new_weight_removed.emit(-1 * thing.get_weight_from_size())
