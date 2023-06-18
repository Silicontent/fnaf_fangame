# FNAF-like AI information mostly comes from Tech Rules on YT
# https://www.youtube.com/watch?v=ujg0Y5IziiY

extends Node2D
class_name RoomMover

signal moved(location: int)

@export var animatronic: String
@export var char_id: int
@export_range(0, 20) var ai: int

@export var places: Dictionary
@export var move_timer: Timer
@export var wait_duration: float
@export var path_amts: int

# progress of the character THROUGH THEIR LOCATIONS ARRAY
var current_progress: int = 0
# location of the character referring to the LOCATION'S ID
var current_location: int = 0
# path the character is taking
var current_path: Array


func _ready() -> void:
	# without this, the owner "Animatronics" won't have a reference to this character
	# ready before the animatronic emits the moved signal
	# this may not be the problem at all, needs more investigation
	await owner.ready
	
	randomize()
	move_timer.wait_time = wait_duration
	reset_to_beginning()
	emit_signal("moved", current_location)


# used to completely disable or enable animatronic
func toggle_animatronic(state: bool) -> void:
	if state:
		move_timer.start()
	elif !state:
		move_timer.stop()


# when the character is successfully fended off, reset them to the beginning of their path
func reset_to_beginning() -> void:
	var rand = randi() % path_amts + 1
	current_path = places[rand]
	print(animatronic + " chosen path: " + str(current_path))
	
	current_progress = 0
	current_location = current_path[0]


func progress_to_location() -> void:
	current_location = current_path[current_progress]
	print("move success, location: " + str(current_location))
	emit_signal("moved", current_location)


# runs whenever the movement timer ends, giving the character a movement opportunity
func _on_move_timer_timeout():
	# randum num between 1 and 20
	var rand = randi() % 20 + 1
	
	# makes random number act like a percent chance to move
	if ai >= rand:
		current_progress += 1
		progress_to_location()
		if current_location == 12:
			move_timer.stop()
			print("in office, ready to attack")
		else:
			move_timer.start()
	else:
		print("move failed, location: " + str(current_location))
		move_timer.start()
