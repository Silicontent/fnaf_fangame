extends Control

@onready var switch_cam_overlay = $SwitchCams


func _ready() -> void:
	switch_cam_overlay.frame = 9


# SWITCH CAMERA GLITCH ---------------------------------------------------
func _on_cam_buttons_cam_changed(_cam):
	switch_cam_overlay.play("default")
