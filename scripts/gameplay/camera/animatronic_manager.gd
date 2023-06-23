extends Control

@onready var fredbear = $Fredbear
@onready var sbonnie = $SpringBonnie

var fredbear_ais = {
	1: [0, 1, 1],
	2: [1, 2, 2],
	3: [2, 3, 4],
	4: [4, 5, 6],
	5: [5, 6, 8],
	6: [0, 0, 0],
	7: [0, 0, 0]
}
var sbonnie_ais = {
	1: [0, 0, 1],
	2: [0, 1, 1],
	3: [1, 2, 2],
	4: [2, 2, 3],
	5: [3, 4, 5],
	6: [0, 0, 0],
	7: [0, 0, 0]
}

var fb_list = []
var sb_list = []

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
	
	if !Globals.custom_night:
		fb_list = fredbear_ais[Globals.current_night]
		sb_list = sbonnie_ais[Globals.current_night]


func set_ai(time: int) -> void:
	if time == 0:
		fredbear.ai = fb_list[0]
		sbonnie.ai = sb_list[0]
	elif time == 2:
		fredbear.ai = fb_list[1]
		sbonnie.ai = sb_list[1]
	elif time == 4:
		fredbear.ai = fb_list[2]
		sbonnie.ai = sb_list[2]
	
	fredbear.get_node("CanvasLayer/Label").text = str(fredbear.ai)
	sbonnie.get_node("CanvasLayer/Label").text = str(sbonnie.ai)


# ANIMATRONIC MOVED ------------------------------------------------------
func _on_fredbear_moved(location):
	fredbear.position = places[location]


func _on_spring_bonnie_moved(location):
	sbonnie.position = places[location]
