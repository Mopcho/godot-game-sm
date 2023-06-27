extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		Game.playerGold += 5
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 50), 1)
		tween.tween_callback(queue_free)
