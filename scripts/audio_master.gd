extends Node

@onready var aud_1 = $Music1
@onready var aud_2 = $Music2
@onready var aud_3 = $Music3


func start_sound(sound: String, track: int, vol: float) -> void:
	match track:
		1:
			aud_1.stream = load(sound)
			aud_1.volume_db = vol
			aud_1.play()
		2:
			aud_2.stream = load(sound)
			aud_2.volume_db = vol
			aud_2.play()
		3:
			aud_3.stream = load(sound)
			aud_3.volume_db = vol
			aud_3.play()


func stop_sound(track: int) -> void:
	match track:
		1:  aud_1.stop()
		2:  aud_2.stop()
		3:  aud_3.stop()
