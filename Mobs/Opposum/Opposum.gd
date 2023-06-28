extends CharacterBody2D

var SPEED = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var dead = false

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if chase && !dead:
		var player = Game.player
		get_node("AnimatedSprite2D").play("Run")
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
		

func death():
	dead = true
	Game.playerGold += 5
	Utils.saveGame()
	var animated_sprite = get_node("AnimatedSprite2D")
	animated_sprite.play("Death")
	await animated_sprite.animation_finished
	self.queue_free()
	


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()


func _on_player_damage_body_entered(body):
	if body.name == "Player":
		Game.playerHP -= 6
		death()
		


