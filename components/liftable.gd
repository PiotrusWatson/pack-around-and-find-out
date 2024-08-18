extends Node

var parent: RigidBody3D

func init(parent):
	self.parent = parent
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func make_grabbable(is_grabbable):
	parent.freeze = is_grabbable
