extends CanvasLayer

@onready var monitor_toggle = $MonitorToggle
@onready var monitor_anim = $MonitorAnimation
@onready var monitor_toggle_anim = $AnimationPlayer

@onready var night_display = $Times/Night
@onready var hour_display = $Times/Hour


func _ready() -> void:
	monitor_toggle.position = Vector2(389.5, 643)
	monitor_toggle.visible = true
	
	monitor_anim.animation = "flip_down"
	monitor_anim.frame = 11
	
	# setting the night label
	if Globals.custom_night:
		night_display.text = "Night 7"
	else:
		night_display.text = "Night " + str(Globals.current_night)


# TIME MECHANICS ---------------------------------------------------------
func _on_hour_changed(hour):
	if hour == 0:
		hour_display.text = "12 AM"
	else:
		hour_display.text = str(hour) + " AM"


func _on_security_camera_toggle(toggle):
	if toggle:
		monitor_toggle_anim.play("button_left")
	elif !toggle:
		monitor_toggle_anim.play("button_middle")


func _on_monitor_animation_finished():
	monitor_anim.z_index = -1


func _on_monitor_animation_changed():
	monitor_anim.z_index = 0

