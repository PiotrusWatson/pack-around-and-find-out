extends Node

var parent: Node3D

func init(parent):
	self.parent = parent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_to_position_3D(position: Vector3):
	parent.position = position
	
func move_to_position_2D(position: Vector2):
	parent.position = Vector3(position.x, parent.position.y, position.y)	
	print(position)
