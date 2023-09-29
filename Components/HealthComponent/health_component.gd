extends Node2D
class_name HealthComponent

@export var max_health = 50
@export var animation_sprite: AnimatedSprite2D
@export var death_animation_name := "Death"
@export var state_machine: StateMachine
var health

func _ready():
	health = max_health

func damage(damage_amount):
	health -= damage_amount
	
	if health <= 0:	
		if "before_death" in get_parent():
			get_parent().before_death()
		if state_machine:
			state_machine.current_state = null
		animation_sprite.play(death_animation_name)
		await animation_sprite.animation_finished
		get_parent().on_death()
