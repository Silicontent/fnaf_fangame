extends Control

@onready var backgrounds = $MainScene
@onready var fredbear_view = $Fredbear
@onready var sbonnie_view = $SpringBonnie


func _on_cam_buttons_cam_changed(cam):
	# since frame starts at 0, subtract 1 from the cam number to get the cam frame
	backgrounds.frame = (cam - 1)
