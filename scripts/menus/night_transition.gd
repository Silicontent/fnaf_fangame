extends Control

@onready var anim_player = $AnimationPlayer
@onready var night_lbl = $NightLabel


func _ready() -> void:
	AudioMaster.stop_sound()
	
	if Globals.custom_night:
		night_lbl.text = "[center][b]Night 7[/b][/center]\n[center]12:00 AM[/center]"
	else:
		night_lbl.text = "[center][b]Night " + str(Globals.current_night) + "[/b][/center]\n[center]12:00 AM[/center]"
	
	anim_player.play("fade")


func _on_animation_player_animation_finished(_anim_name):
	$LoadIcon.visible = true
	$LoadTimer.start()


func _on_load_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/gameplay/game.tscn")
