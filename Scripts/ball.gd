extends RigidBody2D

var push_force = 50  # Adjust to control push strength
var push_vector = Vector2.ZERO
		
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("touch")
		if body.is_caps:
			push_force = 100
		else: # Small box, small player
			push_force = 50
		push_vector = (global_position - body.global_position).normalized()
		apply_force(Vector2.ZERO, push_vector * push_force)
