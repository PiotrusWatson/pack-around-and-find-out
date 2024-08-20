extends Marker3D

@onready var laser = $Laser
@onready var thing_box = $ThingBox
var is_holding = false
@export var offset_amount = 0.02
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_thing():
	laser.force_raycast_update()
	var thing = laser.get_collider()
	if thing.is_in_group("things"):
		return thing
	return null
	
	
func grab():
	if thing_box.holding_something():
		return false
	
	var thing = get_thing()
	if thing == null:
		return false
	print("GRAB")
	thing.make_grabbable(true)
	thing.global_position = global_position
	print("thing is at ", thing.global_position)
	thing.global_position.y -= offset_amount
	thing_box.hold(thing)
	return true
	
func release():
	if !thing_box.holding_something():
		return false
	print("RELEase")
	var thing = thing_box.get_thing()
	thing.make_grabbable(false)
	thing_box.release(thing)
	return true
	
func set_end(point):
	laser.target_position = to_local(point)
	
