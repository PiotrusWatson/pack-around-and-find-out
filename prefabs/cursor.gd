extends Node3D

@onready var mover = $Components/Mover
@onready var pickup_handler = $PickupHandler
@onready var hand_animator = $HandAnimator
var main_camera: Camera3D
var cursor_2D_pos = Vector2.ZERO
const RAY_LENGTH = 1000

const LEFT_CLICK = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	mover.init(self)
	main_camera = get_viewport().get_camera_3d()
	toggle_mouse_visibility(false)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_left_click(event):
	return event is InputEventMouseButton and event.button_index == LEFT_CLICK
	
func _input(event):
	if event is InputEventMouseMotion:
		mover.push_to_position_2D(event.relative)
		cursor_2D_pos += event.relative
	if is_left_click(event) and event.pressed:
		#var new_end_point = get_good_laser_position()
		#pickup_handler.set_end(new_end_point)
		hand_animator.grab()
		pickup_handler.grab()
	elif is_left_click(event) and !event.pressed:
		hand_animator.release()
		pickup_handler.release()
	
func toggle_mouse_visibility(is_visible):
	if is_visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
		
func get_good_laser_position():
	var from = main_camera.project_ray_origin(cursor_2D_pos)
	var to = Vector3(pickup_handler.global_position.x, -100, pickup_handler.global_position.z)
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space.intersect_ray(query)
	var pos = result["position"]
	print("My position", pickup_handler.global_position, "shot position", pos)
	return Vector3(pos.x, -100, pos.z)
	
