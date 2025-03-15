extends StaticBody2D

@export var normal_texture: Texture
@export var pressed_texture: Texture
@export var player: NodePath  # Assign the player node in the inspector

var is_pressed := false

func _ready():
	$Sprite2D.texture = normal_texture  # Set the default texture
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player") and body.velocity.y > 0:  # Ensure the player is falling onto the button
		press()

func _on_body_exited(body):
	if body.is_in_group("player"):
		release()

func press():
	is_pressed = true
	$Sprite2D.texture = pressed_texture
	on_pressed()

func release():
	is_pressed = false
	$Sprite2D.texture = normal_texture

func on_pressed():
	# To be overridden by subclasses
	pass
