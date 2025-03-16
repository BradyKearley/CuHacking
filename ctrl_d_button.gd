extends StaticBody2D
var player: Node2D
var pressed = false
@export var player2: PackedScene
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
	if body.is_in_group("Player"):  # Ensure the player is falling onto the button
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()
	

func _on_timer_timeout() -> void:
	$Timer.wait_time = .3  # Move the player
	if not pressed:
		pressed = true
		var new_player = player2.instantiate()
		get_parent().add_child(new_player)  # Add Player2 to the scene
		new_player.global_position = global_position + Vector2(-38, 0)
	
