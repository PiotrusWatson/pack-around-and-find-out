extends CanvasLayer

@onready var max_kilos = $"Max Kilos"
@onready var debug_kilo_amount = $DebugAmount
@onready var number_of_items = $NumberOfItems
@onready var time_limit = $TimeLimit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func display_max_kilos(kilos):
	max_kilos.text = "Max kg: " + str(kilos)
	
func display_debug_kilos(kilos):
	debug_kilo_amount.text = "Debug current kg: " + str(kilos)

func display_number_of_items(items):
	number_of_items.text = "Items packed: " + str(items)
	
func display_time_limit(time_left):
	time_limit.text = str(time_left)
