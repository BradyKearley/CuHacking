extends StaticBody2D

# Set textures here maybe

var is_pressed = false
var old_pos_y

func _ready() -> void:
	old_pos_y = global_position.y

func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	if $Timer.is_stopped():
		if !body.is_caps: # Maybe change to another higher quality sprite here so it's not fuzzy
			body.scale *= 3;
			body.is_caps = true
		else:
			body.scale /= 3;
			body.is_caps = false
	
	$Timer.start()
	is_pressed = true
	$AnimatedSprite2D.play("Down")

func release() -> void:
	is_pressed = false
	$AnimatedSprite2D.play("Up")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):  # Ensure the player is falling onto the button
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()
