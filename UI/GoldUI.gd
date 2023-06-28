extends Label

func _process(delta):
	text = "Gold: " + str(Game.playerGold)
