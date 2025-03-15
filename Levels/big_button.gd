extends Button

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Camera2D.offset = Vector2(1.5,-2)
		$Camera2D.zoom = Vector2(11.25,10.8)
	else:
		$Camera2D.offset = Vector2(0,0)
		$Camera2D.zoom = Vector2(7,7)
