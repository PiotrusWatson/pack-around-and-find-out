extends Node3D

@onready var mover = $Components/Mover
@onready var pickup_handler = $PickupHandler
@onready var hand_animator = $HandAnimator
var main_camera

const LEFT_CLICK = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	mover.init(self)
	main_camera = get_viewport().get_camera_3d()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_left_click(event):
	return event is InputEventMouseButton #and event.button_index == LEFT_CLICK
	
func _input(event):
	if event is InputEventMouseMotion:
		var mouse_position = main_camera.project_position(get_viewport().get_mouse_position(), main_camera.global_transform.origin.y)
		var mouse_position_2D = Vector2(mouse_position.x, mouse_position.z)
		mover.move_to_position_2D(mouse_position_2D)
		
	if is_left_click(event) and event.pressed:
		hand_animator.grab()
		pickup_handler.grab()
	elif is_left_click(event) and !event.pressed:
		hand_animator.release()
		pickup_handler.release()
	
