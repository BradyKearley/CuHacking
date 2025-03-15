extends StaticBody2D
var actor: Node2D
var disabled = false

func _ready() -> void:
	Shiftvariable.shifted = false

# Set textures here maybe
func press(body: Node2D) -> void:
	# Change if shift signal 
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("Down")
	actor = body

func release() -> void:
	$AnimatedSprite2D.play("Up")
	actor = null
	Shiftvariable.shifted = false

func _on_hitbox_body_entered(body: Node2D) -> void:
	if !disabled:
		if body.is_in_group("Movable"):
			disabled = true
			press(body)
			$Timer.start()
		if body.is_in_group("Player"):
			press(body)
			$Timer.start()

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Movable"):
		disabled = false
	elif body.is_in_group("Player") and !disabled:
		release()

func _on_timer_timeout() -> void:
	$Timer.wait_time = .1  # Move the player
	if(actor):
		Shiftvariable.shifted = true
