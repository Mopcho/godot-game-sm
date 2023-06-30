extends Area2D
class_name HitBoxComponent

@export var health_component: HealthComponent

func damage(attack):
	if health_component:
		health_component.damage(attack)
