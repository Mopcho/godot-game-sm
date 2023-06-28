extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bullet_speed = 200
var bullet = preload("res://Player/Spells/Fireball.tscn")
var can_fire = true
var fire_rate = 0.3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	Game.player = self
	
func flip_to_mouse():
	var is_looking_right = get_global_mouse_position().x < self.position.x
	get_node("AnimatedSprite2D").flip_h = is_looking_right
	
func shoot():
	var bulletInstance = bullet.instantiate()
	bulletInstance.position = get_node("MarkerController/ShootingMarker").global_position
	bulletInstance.new_velocity = get_global_mouse_position() - bulletInstance.position
	
	get_tree().get_root().add_child(bulletInstance)
	can_fire = false
	await get_tree().create_timer(fire_rate).timeout
	can_fire = true

func _physics_process(delta):
	if Input.is_action_pressed("fire") and can_fire:
		shoot()
	
	get_node("MarkerController").look_at(get_global_mouse_position())

	flip_to_mouse()

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
	if velocity.y > 0:
		anim.play("Fall")
	move_and_slide()
	
	if Game.playerHP <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://main-scene.tscn")
