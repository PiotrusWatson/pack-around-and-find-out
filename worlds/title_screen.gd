extends Control

func _ready():
	print(MusicManager.is_node_ready())
	MusicManager.play_menu()
	
func _on_start_button_down():
	Globals.go_to_main()

func _on_instructions_button_down():
	Globals.go_to_instructions()
	
func _on_credits_button_down():
	Globals.go_to_credits()
