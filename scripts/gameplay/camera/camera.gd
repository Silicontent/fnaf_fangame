extends Control

signal camera_toggle(toggle: bool)

@onready var animatronic_manager = $Animatronics
var cam_state = false


func reset_state() -> void:
	cam_state = false


func camera_toggled(active: bool) -> void:
	cam_state = active
	self.visible = active
	emit_signal("camera_toggle", active)


func _on_game_hour_changed(hour):
	animatronic_manager.set_ai(hour)
