extends Node2D

signal hour_changed(hour: int)

@onready var hud = $HUD

@onready var cameras = $HUD/Camera
@onready var monitor_toggle = $HUD/MonitorToggle
@onready var monitor_anim = $HUD/MonitorAnimation

@onready var night_display = $HUD/Times/Night
@onready var hour_display = $HUD/Times/Hour
@onready var hour_timer = $Mechanics/HourTimer

var hour = 0


func _ready() -> void:
	cameras.visible = false
	cameras.reset_state()
	set_hour()
	monitor_anim.animation = "flip_up"
	monitor_anim.frame = 0
	
	# setting the night label
	if Globals.custom_night:
		night_display.text = "Night 7"
	else:
		night_display.text = "Night " + str(Globals.current_night)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		hour += 1
		set_hour()
	if Input.is_action_just_pressed("ui_down"):
		hour -= 1
		set_hour()
	if Input.is_action_just_pressed("ui_accept"):
		beat_night()


# TIME MECHANICS ---------------------------------------------------------
func set_hour() -> void:
	if hour == 0:
		hour_display.text = "12 AM"
	else:
		hour_display.text = str(hour) + " AM"
	
	emit_signal("hour_changed", hour)


func _on_hour_timer_timeout():
	hour += 1
	set_hour()
	
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
	
	get_tree().change_scene_to_file("res://scenes/menus/night_win.tscn")


func game_over():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


# MONITOR MECHANICS -------------------------------------------------------
func toggle_cameras():
	# if camera IS UP CURRENTLY
	if cameras.cam_state:
		monitor_toggle.disabled = true
		monitor_anim.visible = true
		cameras.camera_toggled(false)
		monitor_anim.play("flip_down")
	
	# if camera IS DOWN CURRENTLY
	elif !cameras.cam_state:
		monitor_toggle.disabled = true
		monitor_anim.visible = true
		monitor_anim.play("flip_up")


func _on_monitor_toggle_pressed():
	toggle_cameras()


func _on_monitor_animation_finished():
	if monitor_anim.animation == "flip_up":
		cameras.camera_toggled(true)
	monitor_toggle.disabled = false
