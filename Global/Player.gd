extends Node

var gold = 0
var health = 1
var max_health
var player
var base_health = 100
var level = 1

func _ready():
	gold = 0
	health = 1
	max_health
	player
	base_health = 100
	level = 1

func calculate_player_health():
	max_health = level * base_health
	health = max_health
