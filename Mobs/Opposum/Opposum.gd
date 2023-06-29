extends BaseMob

var animatedSprite

# On Ready set constants
func _ready():
	health = 50
	max_health = 50
	gold_drop = 10
	speed = 200
	level = 1
	animatedSprite = get_node("AnimatedSprite2D")
	animatedSprite.play("Idle")
	super()
	
func _physics_process(delta):
	super(delta)
	if dead:
		return
	elif chase:
		animatedSprite.play("Run")
	else:
		animatedSprite.play("Idle")
	
func before_death():
	super()
	var separate_animated_sprite = get_node("AnimatedSprite2D")
	separate_animated_sprite.play("Death")
	await separate_animated_sprite.animation_finished

# Signals
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		# TODO: set chasing_player
		
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
		# TODO: unset chasing_player

func _on_player_damage_body_entered(body):
	if body.name == "Player":
		deal_damage(5)


