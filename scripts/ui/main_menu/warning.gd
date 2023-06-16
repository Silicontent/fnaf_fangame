extends Control

@onready var anim_player = $AnimationPlayer


func _ready() -> void:
	anim_player.play("warning_fade")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "warning_fade":
		get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
