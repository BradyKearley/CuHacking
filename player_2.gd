extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -200.0
@onready var sprite = $AnimatedSprite2D # Ensure the AnimatedSprite2D node is named properly
var facing_right = true # Track the player's facing direction
var is_caps = false

func change_size() -> void:
	if is_caps:
		$AnimatedSprite2D.scale /= 3
		$CollisionShape2D.scale /= 3
		is_caps = false
	else: 
		$AnimatedSprite2D.scale *= 3
		$CollisionShape2D.scale *= 3
		is_caps = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("Player2Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D.play()
	var direction := Input.get_axis("Player2Left", "Player2Right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			facing_right = true
			sprite.play("walkRight")
		else:
			facing_right = false
			sprite.play("walkLeft")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if facing_right:
			sprite.play("idleRight")
		else:
			sprite.play("idleLeft")

	move_and_slide()
