extends Control


func _on_cam_buttons_cam_changed(_cam):
	'''
	# TODO: checks for if a character is there
	Try making another Control child that holds the actual animatronics
	and their positions, then emit a signal from there to here when movement
	occurs. When this happens, tell the View node to change to look of the
	cameras.
	
	This keeps logic about the look of the cams, the position of the characters,
	and the camera buttons in separate scripts and (theoretically/hopefully)
	improves readability.
	'''
	
	pass
