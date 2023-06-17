extends Control

signal cam_changed(cam: int)

var current_cam: int = 1


func _ready() -> void:
	change_cam(1)


# sets the selected camera and its button while disabling the other buttons
func set_selected_cam(selected_cam: int) -> void:
	for cam in get_children():
		# converts the StringName (cam.name) into a String (cam_str)
		var cam_str = str(cam.name)
		
		if int(cam_str) == selected_cam:
			cam.button_pressed = true
		else:
			cam.button_pressed = false


func change_cam(num: int) -> void:
	current_cam = num
	set_selected_cam(current_cam)
	emit_signal("cam_changed", current_cam)


# CAM BUTTONS CLICKED SIGNALS --------------------------------------------
func _on_cam1_pressed():
	change_cam(1)

func _on_cam2_pressed():
	change_cam(2)

func _on_cam3_pressed():
	change_cam(3)

func _on_cam4_pressed():
	change_cam(4)

func _on_cam5_pressed():
	change_cam(5)

func _on_cam6_pressed():
	change_cam(6)

func _on_cam7_pressed():
	change_cam(7)
