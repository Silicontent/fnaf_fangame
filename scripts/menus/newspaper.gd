extends Control

@onready var anim_player = $AnimationPlayer
var clicked = false


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and !clicked:
		clicked = true
		anim_player.play("fade_out")


func _on_fade_finished(_anim_name):
	get_tree().change_scene_to_file("res://scenes/menus/night_transition.tscn")
