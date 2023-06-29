extends Node

# Replace with users:// evetually
const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"health": Player.health,
		"gold": Player.gold,
		"level": Player.level,
	}
	var json = JSON.stringify(data)
	file.store_line(json)

func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)	
	if FileAccess.file_exists(SAVE_PATH) == true:
		var currentLine = JSON.parse_string(file.get_line())
		if currentLine:
			Player.health = currentLine["health"];
			Player.gold = currentLine["gold"];
			Player.level = currentLine["level"]
