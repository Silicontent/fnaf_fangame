extends Control

@onready var fredbear = $Fredbear
@onready var sbonnie = $SpringBonnie

var places = {
	1: Vector2(864, 588),     # Stage
	2: Vector2(916, 488),     # Dining Room
	3: Vector2(906, 404),     # Backstage
	4: Vector2(1030, 404),    # Kitchen
	5: Vector2(1054, 641),    # Party Room
	6: Vector2(1183, 402),    # Hallway Corner
	7: Vector2(1199, 558),    # Main Vent Shaft
	8: Vector2(1203, 444),    # Right Door
	9: Vector2(1154, 481),    # Left Door
	10: Vector2(1202, 513),   # Vent Exit
	11: Vector2(1104, 423),   # Kitchen Vent
	12: Vector2(1192, 482)    # Office
}


func _ready() -> void:
	for chara in get_children():
		chara.toggle_animatronic(true)


# ANIMATRONIC MOVED ------------------------------------------------------
func _on_fredbear_moved(location):
	fredbear.position = places[location]


func _on_spring_bonnie_moved(location):
	sbonnie.position = places[location]
