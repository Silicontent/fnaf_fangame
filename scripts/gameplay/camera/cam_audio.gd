extends Node

@onready var cam_up = $CamUp
@onready var cam_down = $CamDown
@onready var cam_switch = $CamSwitch


func stop_all() -> void:
	for aud in get_children():
		aud.stop()


func _on_cam_buttons_cam_changed(_cam):
	cam_switch.play()


func _on_camera_toggle(toggle):
	stop_all()
	if toggle:
		cam_up.play()
	elif !toggle:
		cam_down.play()
