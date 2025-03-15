extends StaticBody2D

var disabled = false
var is_pressed = false
var old_pos_y

func _ready() -> void:
	old_pos_y = global_position.y

func press(body: Node2D) -> void:
	if $Timer.is_stopped():
		$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.2)
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play("Down")
		body.change_size()
	
	$Timer.start()
	is_pressed = true

func release() -> void:
	is_pressed = false
	$AnimatedSprite2D.play("Up")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !disabled:
		press(body)
	if body.is_in_group("Movable"):
		press(body)
		disabled = true
		
func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.is_in_group("Movable"):
		disabled = false

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		release()
