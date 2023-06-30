extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	move_and_slide()
	
	velocity.y += gravity * delta
	if velocity.x < 10 && velocity.x > -10 && velocity.x != 0:
		get_node("AnimationPlayer").play("Walk")
	elif velocity.x > 10 || velocity.x < -10:
		get_node("AnimationPlayer").play("Run")
	else:
		get_node("AnimationPlayer").play("Idle")
	
	if velocity.x > 0:
		get_node("AnimatedSprite2D").flip_h = false
	else:
		get_node("AnimatedSprite2D").flip_h = true
