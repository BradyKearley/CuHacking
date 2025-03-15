extends StaticBody2D

# Set textures here maybe

var is_pressed = false
var old_pos_y
var jump_height = 300.0

func _ready() -> void:
	old_pos_y = global_position.y

func press(body: Node2D) -> void:
	# Change if shift signal 
	
	body.velocity.y = -jump_height  # Strong upward push
	body.move_and_slide()  # Apply the new velocity
	
	is_pressed = true
	global_position.y = old_pos_y + 5

func release() -> void:
	is_pressed = false
	global_position.y = old_pos_y

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):  # Ensure the player is falling onto the button
		press(body)

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()
