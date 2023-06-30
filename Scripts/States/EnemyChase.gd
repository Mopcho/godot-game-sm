extends State
class_name EnemyChase

@export var enemy: CharacterBody2D
@export var move_speed := 100
@export var stop_chase_distance := 400
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")
		
func Physics_Update(delta: float):
	if enemy:
		var direction = (player.global_position - enemy.global_position)
		if direction.length() < stop_chase_distance:
			enemy.velocity.x = direction.normalized().x * move_speed
		else:
			enemy.velocity.x = 0
		if direction.length() > stop_chase_distance:
			Transition.emit(self, "Idle")
