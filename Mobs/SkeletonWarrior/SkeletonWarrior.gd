extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animationSprite: AnimatedSprite2D
var animationPlayer: AnimationPlayer
var dead = false

func _ready():
	animationSprite = get_node("AnimatedSprite2D")
	animationPlayer = get_node("AnimationPlayer")

func _physics_process(delta):
	if dead:
		return;
	move_and_slide()
	
	velocity.y += gravity * delta
	
	if velocity.x > 0:
		animationSprite.flip_h = false
	else:
		animationSprite.flip_h = true
		
func on_death():
	queue_free()

func before_death():
	dead = true
