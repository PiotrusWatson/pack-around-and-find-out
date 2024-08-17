extends Node3D

@onready var mover = $Components/Mover
var main_camera

# Called when the node enters the scene tree for the first time.
func _ready():
	mover.init(self)
	main_camera = get_viewport().get_camera_3d()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_position = main_camera.project_position(get_viewport().get_mouse_position(), main_camera.global_transform.origin.y)
		var mouse_position_2D = Vector2(mouse_position.x, mouse_position.z)
		mover.move_to_position_2D(mouse_position_2D)
