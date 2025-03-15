extends RigidBody2D

var is_caps = false
var push_force = 300  # Adjust to control push strength

func _on_left_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		linear_velocity.x = 1.0 * push_force  # Apply force to move the box

func _on_right_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		linear_velocity.x = -1.0 * push_force  # Apply force to move the box
