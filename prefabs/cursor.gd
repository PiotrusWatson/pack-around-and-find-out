extends Node3D

@onready var mover = $Components/Mover
@onready var pickup_handler = $PickupHandler
@onready var hand_animator = $HandAnimator
var main_camera: Camera3D

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
	if is_left_click(event) and event.pressed:
		var new_target = get_target_relative_to_camera()
		pickup_handler.set_end(new_target)
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
		

func get_target_relative_to_camera():
	return (pickup_handler.global_position - main_camera.global_position) * main_camera.global_position.y
	
