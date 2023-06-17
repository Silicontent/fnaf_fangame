extends Node

var current_night = 1
var five = false
var six = false
var impossible = false

var custom_night = false
var custom_20 = false


func _process(_delta: float) -> void:
	if Input.is_action_just_released("quit"):
		get_tree().quit()
