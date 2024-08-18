extends StaticBody3D

var things = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_thing_detector_body_entered(body):
	if !body.is_in_group("things"):
		return
	things[body.name] = body
	print(body.name)


func _on_thing_detector_body_exited(body):
	if !body.is_in_group("things"):
		return
	things.erase(body.name)
