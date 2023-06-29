extends CharacterBody2D

var new_velocity = Vector2(0, 0)
var speed = 300

func _physics_process(delta):
	get_node("AnimatedSprite2D").play("Idle")
	move_and_collide(new_velocity.normalized() * delta * speed)

func _on_deal_damage_body_entered(body):
	if body.is_in_group("mobs"):
		body.take_damage(10)
	queue_free()

