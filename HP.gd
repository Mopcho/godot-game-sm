extends Label

func _process(delta):
	text = "HP: " + str(Game.playerHP)
