extends CharacterBody2D

class_name BaseMob

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var level = 1
var health = 40
var max_health = 40
var damage = 10
var gold_drop = 10
var dead = false
var attacking = false
var speed = 200
var chase = false
var chasing_player
var first_flip_h
# Implement Threat Level

func _ready():
	first_flip_h = get_node("AnimatedSprite2D").flip_h

func _physics_process(delta):
	velocity.y += gravity * delta
	update_health()
	
	if chase && !dead:
		var player = Player.player
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = first_flip_h
		else:
			get_node("AnimatedSprite2D").flip_h = !first_flip_h
		velocity.x = direction.x * speed
	elif !dead:
		velocity.x = 0
	if !dead:
		move_and_slide()
	
func deal_damage(damage):
	Player.health -= damage

# death
func death():
	await before_death()
	Player.gold += gold_drop
	Utils.saveGame()
	self.queue_free()
	
func before_death():
	dead = true
	attacking = false
	
func update_health():
	var healthBar: TextureProgressBar = get_node("HealthBar")
	healthBar.max_value = max_health
	healthBar.value = health
	
func take_damage(damage):
	health -= damage
	if health <= 0:
		death()


# TODO: Callback, _physics_process, chasing player
