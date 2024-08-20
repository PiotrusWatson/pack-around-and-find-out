extends RigidBody3D
class_name Thing
@onready var liftable = $Liftable
@export var weight_data: WeightData

# Called when the node enters the scene tree for the first time.
func _ready():
	mass = get_weight_from_size()
	liftable.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func make_grabbable(is_grabbable):
	liftable.make_grabbable(is_grabbable)

func get_weight():
	return weight_data.kilos
	
func get_weight_from_size():
	return weight_data.get_weight_from_size(scale.x)


