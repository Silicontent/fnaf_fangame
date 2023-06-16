extends Resource
class_name SaveData

@export var night = 0
@export var beat_five = false
@export var beat_six = false
@export var beat_impossible = false


func set_progress(progress: int) -> void:
	night = progress
