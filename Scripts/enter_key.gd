extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.play()
		$Timer.start()

func _on_timer_timeout() -> void:
	LevelManager.load_next_level()
