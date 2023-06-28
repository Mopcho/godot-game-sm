extends Node2D

func _ready():
	Utils.loadGame()
	if Game.playerHP <= 0:
		Game.playerHP = 1000
	Utils.saveGame()

func _on_quit_button_pressed():
	get_tree().quit()


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainWorld/world.tscn")
