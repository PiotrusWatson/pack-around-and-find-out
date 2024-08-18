extends RigidBody3D

@onready var liftable = $Liftable
# Called when the node enters the scene tree for the first time.
func _ready():
	liftable.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func make_grabbable(is_grabbable):
	liftable.make_grabbable(is_grabbable)


func _on_body_entered(body):
	print(body.name)
