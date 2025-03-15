extends RigidBody2D

var is_caps = false
var push_force = 50  # Adjust to control push strength
		
func _on_left_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.is_caps:
			physics_material_override.friction = 0.08
		else:
			physics_material_override.friction = 1
		linear_velocity.x = 1.0 * push_force  # Apply force to move the box

func _on_right_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.is_caps:
			physics_material_override.friction = 0.08
		else:
			physics_material_override.friction = 1
		linear_velocity.x = -1.0 * push_force  # Apply force to move the box
