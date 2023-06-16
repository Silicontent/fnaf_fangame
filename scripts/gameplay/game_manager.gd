extends Node2D


func _ready() -> void:
	pass


'''
func _ready() -> void:
	if Globals.custom_night:
		$Label.text = "Night 7"
	else:
		$Label.text = "Night " + str(Globals.current_night)
'''


# WIN/LOSE FUNCTIONS -----------------------------------------------------
func beat_night():
	if Globals.current_night == 5:
		Globals.five = true
	if Globals.current_night == 6:
		Globals.six = true
	if Globals.custom_20:
		Globals.impossible = true
	
	if !Globals.custom_night and Globals.current_night != 6:
		Globals.current_night += 1
	
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func game_over():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
