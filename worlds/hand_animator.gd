extends Sprite3D

@export var open: Texture2D
@export var closed: Texture2D

# Called when the node enters the scene tree for the first time.
func grab():
	texture = closed
	
func release():
	texture = open
