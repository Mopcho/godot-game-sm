extends BaseMob

var animationPlayer: AnimationPlayer

func _ready():
	level = 2
	health = 20
	speed = 100
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("Idle")
	super()

func _physics_process(delta):
	super(delta)
	
	if dead || attacking:
		return
	elif chase:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")

func before_death():
	super()
	animationPlayer.play("Death")
	await animationPlayer.animation_finished

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

	
	

