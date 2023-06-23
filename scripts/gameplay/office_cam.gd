# OFFICE MOVEMENT CODE FROM Blackrabbit Kirigamy on GameJolt
# game where code is from: https://gamejolt.com/games/fnaf3remix/792583
# game creator: https://gamejolt.com/@BlackrabbitKirigamy

extends Camera2D

@export var pan_speed = 40
var move_radius = 30
var enable_cam = false


func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var mouse_delta = mouse_pos - global_position
	if mouse_delta.length() >= move_radius and enable_cam == false:
		position += (mouse_delta / move_radius) * pan_speed * delta


func _on_security_camera_toggle(toggle):
	enable_cam = toggle
