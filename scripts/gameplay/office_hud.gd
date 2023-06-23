extends CanvasLayer

@onready var monitor_toggle = $MonitorToggle
@onready var monitor_anim = $MonitorAnimation
@onready var monitor_toggle_anim = $AnimationPlayer


func _ready() -> void:
	monitor_toggle.position = Vector2(389.5, 643)
	monitor_toggle.visible = true
	monitor_anim.z_index = 0


func _on_security_camera_toggle(toggle):
	if toggle:
		monitor_toggle_anim.play("button_left")
	elif !toggle:
		monitor_toggle_anim.play("button_middle")


func _on_monitor_animation_finished():
	monitor_anim.z_index = -1


func _on_monitor_animation_changed():
	monitor_anim.z_index = 0
