extends Node2D

@onready var hud = $HUD

@onready var cameras = $HUD/Camera
@onready var monitor_toggle = $HUD/MonitorToggle
@onready var monitor_anim = $MonitorAnimation

@onready var night_display = $HUD/Times/Night
@onready var hour_display = $HUD/Times/Hour
@onready var hour_timer = $Mechanics/HourTimer

var cam_state = false
var can_flip_cams = true
var hour = 0


func _ready() -> void:
	cameras.visible = false
	cam_state = false
	set_hour(hour)
	monitor_anim.animation = "flip_up"
	monitor_anim.frame = 0
	
	# setting the night label
	if Globals.custom_night:
		night_display.text = "Night 7"
	else:
		night_display.text = "Night " + str(Globals.current_night)


# TIME MECHANICS ---------------------------------------------------------
func set_hour(time: int) -> void:
	if time == 0:
		hour_display.text = "12 AM"
	else:
		hour_display.text = str(hour) + " AM"


func _on_hour_timer_timeout():
	hour += 1
	set_hour(hour)
	
	if hour >= 6:
		beat_night()
	else:
		hour_timer.start()


# WIN/LOSE FUNCTIONS -----------------------------------------------------
func beat_night():
	if Globals.current_night == 5:
		Globals.five = true
	if Globals.current_night == 6:
		Globals.six = true
	if Globals.custom_20:
		Globals.impossible = true
	
	if !Globals.custom_night and Globals.current_night != 6:
		Globals.current_night += 1
	
	get_tree().change_scene_to_file("res://scenes/gameplay/night_win.tscn")


func game_over():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


# MONITOR MECHANICS -------------------------------------------------------
func toggle_cameras():
	# if camera IS UP CURRENTLY
	if cam_state:
		monitor_toggle.disabled = true
		cam_state = false
		cameras.visible = false
		monitor_anim.visible = true
		monitor_anim.play("flip_down")
	
	# if camera IS DOWN CURRENTLY
	elif !cam_state:
		monitor_toggle.disabled = true
		cam_state = true
		monitor_anim.visible = true
		monitor_anim.play("flip_up")


func _on_monitor_toggle_pressed():
	toggle_cameras()


func _on_monitor_animation_finished():
	if monitor_anim.animation == "flip_up":
		cameras.visible = true
	monitor_toggle.disabled = false
