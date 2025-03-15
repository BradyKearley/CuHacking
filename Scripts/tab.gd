extends StaticBody2D

@export var normal_texture: Texture
@export var pressed_texture: Texture

var is_pressed = false

#func _ready():
	#$Sprite2D.texture = normal_texture  # Set the default texture

func _on_body_exited(body):
	if body.is_in_group("player"):
		release()

func press():
	is_pressed = true
	$Sprite2D.texture = pressed_texture

func release():
	is_pressed = false
	$Sprite2D.texture = normal_texture

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and body.velocity.y > 0:  # Ensure the player is falling onto the button
		press()
