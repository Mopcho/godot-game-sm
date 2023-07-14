extends State
class_name EnemyAttack

@export var animation_player: AnimationPlayer
@export var enemy: CharacterBody2D
@export var stop_attack_distance := 70
var player: CharacterBody2D


func Enter():
	player = get_tree().get_first_node_in_group("player")
	animation_player.animation_finished.connect(on_animation_finished)

func Update(delta: float):
	pass
		
func Physics_Update(delta: float):
	var direction = (player.global_position - enemy.global_position)
	
	enemy.velocity = Vector2()
	
	if direction.length() >= stop_attack_distance:
		Transition.emit(self, "Follow")
	else:
		animation_player.play("Attack")

func on_animation_finished(name):
	var player_health_comp = player.get_node("HealthComponent")
	player_health_comp.damage(10)
