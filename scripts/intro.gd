extends Control

@onready var anim_player = $AnimationPlayer
@onready var wait_timer = $Timer


func _ready() -> void:
	anim_player.play("intro_animation")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		wait_timer.stop()
		anim_player.play("intro_fade")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro_animation":
		wait_timer.start()
	elif anim_name == "intro_fade":
		get_tree().change_scene_to_file("res://scenes/menus/warning.tscn")


func _on_timer_timeout():
	anim_player.play("intro_fade")
