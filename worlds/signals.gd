extends Node3D

@onready var basket = $Basket
@onready var ui = $UI
@onready var god = $God

# Called when the node enters the scene tree for the first time.
func _ready():
	basket.thing_added.connect(ui.display_number_of_items)
	basket.thing_removed.connect(ui.display_number_of_items)
	basket.new_weight_added.connect(god.increment_current_weight)
	basket.new_weight_removed.connect(god.increment_current_weight)
	god.current_weight_changed.connect(ui.display_debug_kilos)
	god.generated_max_weight.connect(ui.display_max_kilos)
	god.timer_ticked.connect(ui.display_time_limit)
	god.init()
