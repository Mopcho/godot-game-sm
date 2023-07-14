extends CharacterBody2D

var new_velocity = Vector2(0, 0)
var speed = 300
var collided = false

func _physics_process(delta):
	if !collided:
		get_node("AnimationPlayer").play("Idle")
		move_and_collide(new_velocity.normalized() * delta * speed)

func _on_deal_damage_body_entered(body):
	var hitBoxComponent = body.get_node("HitBoxComponent")
	if body.is_in_group("mobs") and hitBoxComponent:
		hitBoxComponent.damage(10)
	collided = true
	var anim_player = get_node("AnimationPlayer")
	anim_player.play("Boom")
	await anim_player.animation_finished
	queue_free()

