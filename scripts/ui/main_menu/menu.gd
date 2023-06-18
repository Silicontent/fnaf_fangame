extends Control

@onready var static_overlay = $Static/AnimatedSprite2D
@onready var anim_player = $AnimationPlayer
@onready var paper = $PaperOverlay

@onready var star1 = $Stars/Star1
@onready var star2 = $Stars/Star2
@onready var star3 = $Stars/Star3

@onready var extras_btn = $UI/MarginContainer/VBoxContainer/Buttons/VBoxContainer/ExtrasButton
@onready var continue_display = $UI/MarginContainer/VBoxContainer/Buttons/VBoxContainer/ContinueButton/Label
@onready var aud_hover = $Audio/OptionHover

var save_path = "user://save/"
var save_name = "FNAFB_Data.tres"
var save_res = SaveData.new()


func _ready() -> void:
	anim_player.play("fade_in")
	
	static_overlay.visible = true
	static_overlay.play("default")
	paper.visible = false
	
	verify_save_dir(save_path)
	check_progress()
	
	load_data()
	continue_display.text = "(" + str(save_res.night) + ")"
	
	AudioMaster.start_sound("res://assets/audio/menus/menu_bgm.wav", 0.0)


# SAVING AND LOADING DATA ------------------------------------------------
func verify_save_dir(path: String):
	DirAccess.make_dir_absolute(path)


func check_progress() -> void:
	if Globals.five:
		save_res.beat_five = true
	if Globals.six:
		save_res.beat_six = true
	if Globals.impossible:
		save_res.beat_impossible = true
	
	extras_btn.disabled = not(save_res.beat_six)
	
	if Globals.current_night > save_res.night:
		save_res.set_progress(Globals.current_night)
		save_data()
	
	if save_res.beat_five:
		star1.visible = true
	else:
		star1.visible = false
	
	if save_res.beat_six:
		star2.visible = true
	else:
		star2.visible = false
	
	if save_res.beat_impossible:
		star3.visible = true
	else:
		star3.visible = false


func load_data() -> void:
	save_res = ResourceLoader.load(save_path + save_name).duplicate(true)


func save_data() -> void:
	ResourceSaver.save(save_res, save_path + save_name)


# ENTERING NIGHT ---------------------------------------------------------
func begin_night(intro: bool) -> void:
	if !Globals.custom_night:
		Globals.current_night = save_res.night
	
	if intro:
		anim_player.play("paper_fade_in")
	else:
		get_tree().change_scene_to_file("res://scenes/main_menu/night_transition.tscn")
	


# BUTTON SIGNALS ---------------------------------------------------------
func _on_new_game_button_pressed():
	Globals.custom_night = false
	save_res.set_progress(1)
	save_data()
	begin_night(true)


func _on_continue_button_pressed():
	Globals.custom_night = false
	begin_night(false)


# temp functionality to test custom night
func _on_extras_button_pressed():
	Globals.custom_night = true
	begin_night(false)


func _on_option_button_entered():
	aud_hover.play()


# NEWSPAPER ANIMATION ----------------------------------------------------
func _on_paper_anim_finished(anim_name):
	if anim_name == "paper_fade_in":
		get_tree().change_scene_to_file("res://scenes/main_menu/newspaper.tscn")
