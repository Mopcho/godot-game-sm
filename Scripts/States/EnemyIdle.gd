extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed := 20
@export var start_chase_distance := 200
var player: CharacterBody2D
@export var animation_sprite_2d: AnimatedSprite2D

var move_direction
var wander_time: float

func randomize_wander():
	move_direction = randf_range(-1, 1)
	wander_time = randf_range(1, 3)
	
func Enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("player")

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	animation_sprite_2d.play("Walk")
	if enemy:
		enemy.velocity.x = move_direction * move_speed
	var direction = player.global_position - enemy.global_position
	if direction.length() <= start_chase_distance && !player.dead:
		Transition.emit(self, "Follow")
	



