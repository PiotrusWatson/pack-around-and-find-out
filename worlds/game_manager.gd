extends Node

signal generated_max_weight(weight)
signal current_weight_changed(weight)

@export var max_weight_limit: Vector2
var max_weight
var current_weight = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	max_weight = generate_max_weight()
	generated_max_weight.emit(max_weight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_max_weight():
	return randi_range(max_weight_limit.x, max_weight_limit.y)
	
func increment_current_weight(weight):
	current_weight += weight
	current_weight_changed.emit(current_weight)
