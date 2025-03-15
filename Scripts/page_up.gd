extends StaticBody2D

# Set textures here maybe
var actor: Node2D
var disabled = false
var jump_height = 300.0

func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Down")
	actor = body

func release() -> void:
	actor = null
	$AnimatedSprite2D.play("Up")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if !disabled:
		if(body.is_in_group("Movable")):
			disabled = true
			press(body)
		if body.is_in_group("Player") and !disabled:
			press(body)
			$Timer.start()

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()
	if body.is_in_group("Movable"):
		disabled = false

func _on_timer_timeout() -> void:
	$Timer.wait_time = .1  # Move the player
	if(actor):
		if(actor.is_in_group("Player")):
			actor.velocity.y = -jump_height  # Strong upward push
			actor.move_and_slide()  # Apply the new velocity
