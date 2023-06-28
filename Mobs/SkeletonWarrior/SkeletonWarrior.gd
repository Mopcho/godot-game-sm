extends CharacterBody2D

var damage = 5
var SPEED = 70
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var dead = false
var attacking = false
var playingOtherAnimation = false
var animationPlayer: AnimationPlayer

func _ready():
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("Idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if chase && !dead && !attacking:
		var player = Game.player
		animationPlayer.play("Run")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction.x * SPEED
	elif !dead && !attacking:
		velocity.x = 0
		animationPlayer.play("Idle")
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_player_damage_body_entered(body):
	if body.name == "Player":
		attacking = true
		animationPlayer.play("Attack")

func _on_player_damage_body_exited(body):
	if body.name == "Player":
		attacking = false
		
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		Game.playerHP -= damage
		if attacking:
			animationPlayer.play("Attack")
			
func death():
	dead = true
	Game.playerGold += 5
	Utils.saveGame()
	animationPlayer.play("Death")
	await animationPlayer.animation_finished
	self.queue_free()
	

