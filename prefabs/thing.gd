extends RigidBody3D

@onready var liftable = $Liftable
@export var weight: float
# Called when the node enters the scene tree for the first time.
func _ready():
	liftable.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func make_grabbable(is_grabbable):
	liftable.make_grabbable(is_grabbable)


