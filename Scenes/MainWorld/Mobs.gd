extends Node2D

var rng = RandomNumberGenerator.new()

func _process(delta):
	var numberOfMobs = get_child_count()
	if numberOfMobs < 6:
		var frogScene = load("res://Mobs/Frog/Frog.tscn")
		var frogInstance = frogScene.instantiate()
		var randomX = rng.randf_range(25.0, 900)
		frogInstance.set_position(Vector2(40, 352))
		add_child(frogInstance)
