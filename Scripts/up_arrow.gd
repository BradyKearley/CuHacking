extends StaticBody2D
var player: Node2D
# Set textures here maybe
func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Down")
	player = body
	$Timer.start()
	# test

func release() -> void:
	$AnimatedSprite2D.play("Up")
	player = null

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") or body.is_in_group("Movable"):  # Ensure the player is falling onto the button
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") or body.is_in_group("Movable"):
		release()

func _on_timer_timeout() -> void:
	if(player):
		if Volume.volume < 10:
			Volume.volume += 0.25
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(Volume.volume))
