extends RigidBody2D

var is_caps = false
var push_force = 50  # Adjust to control push strength
		
func change_size() -> void:
	if is_caps:
		$AnimatedSprite2D.scale /= 3
		$CollisionShape2D.scale /= 3
		$LeftCollider/LHitbox.scale /= 3
		$LeftCollider/LHitbox.global_position.x += 8
		$RightCollider/RHitbox.scale /= 3
		$RightCollider/RHitbox.global_position.x -= 8
		is_caps = false
	else: 
		$AnimatedSprite2D.scale *= 3
		$CollisionShape2D.scale *= 3
		$LeftCollider/LHitbox.scale *= 3
		$LeftCollider/LHitbox.global_position.x -= 8
		$RightCollider/RHitbox.scale *= 3
		$RightCollider/RHitbox.global_position.x += 8
		is_caps = true
		
func _on_left_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if is_caps and !body.is_caps: # Big box, small player
			physics_material_override.friction = 100
		elif is_caps and body.is_caps: # Big box, big player
			push_force = 100
			physics_material_override.friction = 1
		elif !is_caps and body.is_caps: # Small box, big player
			physics_material_override.friction = 0.08
		else: # Small box, small player
			physics_material_override.friction = 1
		linear_velocity.x = 1.0 * push_force  # Apply force to move the box
		push_force = 50

func _on_right_collider_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if is_caps and !body.is_caps: # Big box, small player
			physics_material_override.friction = 100
		elif is_caps and body.is_caps: # Big box, big player
			push_force = 100
			physics_material_override.friction = 1
		elif !is_caps and body.is_caps: # Small box, big player
			physics_material_override.friction = 0.08
		else: # Small box, small player
			physics_material_override.friction = 1
		linear_velocity.x = 1.0 * push_force  # Apply force to move the box
		push_force = 50
