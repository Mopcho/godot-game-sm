extends Area2D

@export var health_component: HealthComponent

func damage(attack):
	if health_component:
		health_component.da
