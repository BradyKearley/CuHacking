extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -200.0
@onready var sprite = $AnimatedSprite2D # Ensure the AnimatedSprite2D node is named properly
var facing_right = true # Track the player's facing direction
var is_caps = false

const COYOTE_TIME = 0.1  # 0.1 seconds of coyote time
var coyote_timer = 0.0

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
	# Handle coyote time
	if is_on_floor():
		coyote_timer = COYOTE_TIME  # Reset coyote timer when on ground
	else:
		coyote_timer -= delta  # Decrease timer when in the air
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and coyote_timer > 0:
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D.play()
		coyote_timer = 0  # Disable coyote time after jumping
		
	var direction := Input.get_axis("Left", "Right")
	
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
