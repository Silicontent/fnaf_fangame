extends Control

signal cam_changed(cam: int)

var current_cam: int = 1


func _ready() -> void:
	set_selected_cam(1)


# sets the selected camera and its button while disabling the other buttons
func set_selected_cam(selected_cam: int) -> void:
	for cam in get_children():
		# converts the StringName (cam.name) into a String (cam_str)
		var cam_str = str(cam.name)
		
		if int(cam_str) == selected_cam:
			cam.button_pressed = true
		else:
			cam.button_pressed = false


func change_cam() -> void:
	set_selected_cam(current_cam)
	emit_signal("cam_changed", current_cam)


# CAM BUTTONS CLICKED SIGNALS --------------------------------------------
func _on_cam1_pressed():
	current_cam = 1
	change_cam()

func _on_cam2_pressed():
	current_cam = 2
	change_cam()

func _on_cam3_pressed():
	current_cam = 3
	change_cam()

func _on_cam4_pressed():
	current_cam = 4
	change_cam()

func _on_cam5_pressed():
	current_cam = 5
	change_cam()

func _on_cam6_pressed():
	current_cam = 6
	change_cam()

func _on_cam7_pressed():
	current_cam = 7
	change_cam()
