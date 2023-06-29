extends Node2D
class_name HealthComponent

@export var max_health = 50
var health

func _ready():
	health = max_health

func damage(damage_amount):
	health -= damage_amount
	
	if health <= 0:
		get_parent().queue_free()
