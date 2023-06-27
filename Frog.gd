extends CharacterBody2D

var SPEED = 70
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var dead = false

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if chase && !dead:
		get_node("AnimatedSprite2D").play("Jump")
		player = get_node("../../Player2/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	elif !dead:
		velocity.x = 0
		get_node("AnimatedSprite2D").play("Idle")
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		dead = true
		var animated_sprite = get_node("AnimatedSprite2D")
		animated_sprite.play("Death")
		await animated_sprite.animation_finished
		self.queue_free()
