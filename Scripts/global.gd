extends Node2D

func _input(event):
	if event is InputEventKey and event.pressed and event.ctrl_pressed and event.keycode == KEY_Z:
		get_tree().reload_current_scene()
