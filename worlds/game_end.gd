extends Control

var score = 0
@export var packed_multiplier = 1000
@export var bonus_close_multiplier = 500

@onready var item_packer = $ItemPacker
@onready var with_weight = $WithWeight
@onready var over_under = $OverUnder
@onready var score_label = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
