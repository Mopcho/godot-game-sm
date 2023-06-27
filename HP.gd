extends Label

func _process(delta):
	text = "HP: " + str(get_node("../../Player2/Player").health)
