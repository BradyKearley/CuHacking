extends StaticBody2D

var actor: Node2D

func _ready() -> void:
	$AnimatedSprite2D.play("Up")
func press(body: Node2D) -> void:
	# Change if shift signal 
	actor = body
	$AudioStreamPlayer2D.play()
	$Timer.start()

func release() -> void:
	actor = null

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		press(body)

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
