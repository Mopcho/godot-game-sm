extends Node2D

var rng = RandomNumberGenerator.new()

func _process(delta):
	var numberOfMobs = get_child_count()
	if numberOfMobs > 6:
		var skeletonWarrior = load("res://Mobs/SkeletonWarrior/SkeletonWarrior.tscn")
		var skeletonWarriorInstance = skeletonWarrior.instantiate()
		var randomX = rng.randf_range(25.0, 900)
		skeletonWarriorInstance.set_position(Vector2(randomX, 352))
		add_child(skeletonWarriorInstance)
