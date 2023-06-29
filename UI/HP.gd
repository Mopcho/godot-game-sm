extends Label

func _process(delta):
	text = "HP: " + str(Player.health)
