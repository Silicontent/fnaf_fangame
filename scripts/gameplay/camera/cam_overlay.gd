extends Control

@onready var switch_cam_overlay = $SwitchCams
@onready var static_overlay = $Static
@onready var anim_player = $AnimationPlayer


func _ready() -> void:
	switch_cam_overlay.frame = 9
	static_overlay.play("default")


# SWITCH CAMERA GLITCH ---------------------------------------------------
func _on_cam_buttons_cam_changed(_cam):
	switch_cam_overlay.play("default")


# ANIMATRONIC MOVED ------------------------------------------------------
func _on_character_moved(_location):
	anim_player.play("static_flash")
