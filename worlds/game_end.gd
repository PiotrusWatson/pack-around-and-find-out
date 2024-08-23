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
	score += Globals.number_of_items * packed_multiplier
	item_packer.text = "You packed " + str(Globals.number_of_items) + " items."
	with_weight.text = "For a sum total of " + str(Globals.current_filled_weight) + " kg."
	var under = Globals.current_filled_weight <= Globals.max_weight
	var descriptor = ""
	if under:
		descriptor = "under"
	else:
		descriptor = "over"
	over_under.text = "This was " + descriptor + " the maximum weight of " + str(Globals.max_weight) + " kg."
	if under:
		score_label.text = "Good job! You have a final score of: " + str(score)
	else:
		score_label.text = "Oops. You went over and now you're being detained in airport jail :("
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	MusicManager.play_menu()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	Globals.go_to_main()


func _on_menu_button_button_down():
	Globals.go_to_title()
