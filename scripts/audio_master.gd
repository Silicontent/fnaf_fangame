extends Node

@onready var music_track = $MusicTrack


func start_sound(sound: String, vol: float) -> void:
	music_track.stream = load(sound)
	music_track.volume_db = vol
	music_track.play()


func stop_sound() -> void:
	music_track.stop()
