extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed := 20

var move_direction
var wander_time: float

func randomize_wander():
	move_direction = randf_range(-1, 1)
	wander_time = randf_range(1, 3)
	
func Enter():
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
		enemy.velocity.x = move_direction * move_speed
	



