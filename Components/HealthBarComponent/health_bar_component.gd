extends Node2D

@export var texture_progress_bar: TextureProgressBar
@export var progress_bar: ProgressBar
@export var health_component: HealthComponent

func _process(delta):
	if !health_component:
		return
	if texture_progress_bar:
		texture_progress_bar.max_value = health_component.max_health
		texture_progress_bar.value = health_component.health
	elif progress_bar:
		progress_bar.max_value = health_component.max_health
		progress_bar.value = health_component.healthW
