extends Node2D

var Cherry = preload("res://Collectables/Effects/Cherry.tscn")

var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	var cherryCount = self.get_child_count()
	if cherryCount < 10:
		var cherryTemp = Cherry.instantiate()
		var randomX = rng.randf_range(25.0, 900)
		var randomY = rng.randf_range(200, 340)
		cherryTemp.position = Vector2(randomX, randomY)
		add_child(cherryTemp)

