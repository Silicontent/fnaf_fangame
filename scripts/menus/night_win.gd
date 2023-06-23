extends Control

@onready var anim_player = $AnimationPlayer


func _ready() -> void:
	anim_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		anim_player.play("5_to_6")
	elif anim_name == "5_to_6":
		anim_player.play("fade_out")
	elif anim_name == "fade_out":
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
