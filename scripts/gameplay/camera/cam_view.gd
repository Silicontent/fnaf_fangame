extends Control

@onready var backgrounds = $MainScene
@onready var fredbear_view = $Fredbear
@onready var sbonnie_view = $SpringBonnie

var fb_loc = 0
var sb_loc = 0
var camera = 0


func _ready() -> void:
	fredbear_view.visible = false
	sbonnie_view.visible = false


func _on_cam_buttons_cam_changed(cam):
	camera = cam
	# since frame starts at 0, subtract 1 from the cam number to get the cam frame
	backgrounds.frame = (cam - 1)
	check_for_character()


# checks if a character is being looked at
func check_for_character() -> void:
	if fb_loc == camera:
		fredbear_view.visible = true
	else:
		fredbear_view.visible = false
	if sb_loc == camera:
		sbonnie_view.visible = true
	else:
		sbonnie_view.visible = false


# ANIMATRONIC MOVED ------------------------------------------------------
func _on_fredbear_moved(location):
	fb_loc = location
	# doesn't change the character's camera sprite if the character's location is
	# above 7 (all places above 7 are either in vents, at doors, or in the office)
	if location <= 7:
		fredbear_view.frame = (location - 1)
	check_for_character()
