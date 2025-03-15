extends StaticBody2D

# Set textures here maybe
var player: Node2D

var jump_height = 300.0

func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Down")
	player = body
	$Timer.start()

func release() -> void:
	player = null
	$AnimatedSprite2D.play("Up")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):  # Ensure the player is falling onto the button
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()


func _on_timer_timeout() -> void:
	$Timer.wait_time = .1  # Move the player
	if(player):
		player.velocity.y = -jump_height  # Strong upward push
		player.move_and_slide()  # Apply the new velocity
