extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	move_and_slide()
	
	velocity.y += gravity * delta
	
	var absVelocityX = abs(velocity.x)

	if absVelocityX > 50:
		get_node("AnimatedSprite2D").play("Run")
	elif absVelocityX <= 50:
		get_node("AnimatedSprite2D").play("Walk")
	else:
		get_node("AnimatedSprite2D").play("Idle")
	
	if velocity.x > 0:
		get_node("AnimatedSprite2D").flip_h = false
	else:
		get_node("AnimatedSprite2D").flip_h = true
