extends StaticBody2D

var actor: Node2D

func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Down")
	actor = body
	$Timer.start()
	# test

func release() -> void:
	$AnimatedSprite2D.play("Up")
	actor = null

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") or body.is_in_group("Ball"):
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	print("FUCK")
