extends Control

@onready var anim_player = $AnimationPlayer


func _ready() -> void:
	anim_player.play("warning_fade_in")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		anim_player.play("warning_fade_out")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "warning_fade_out":
		get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
