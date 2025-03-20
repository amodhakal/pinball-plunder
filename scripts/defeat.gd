extends Node2D

@onready var PlayBtn = $Play
@onready var PointsLabel = $Points
var gameLvl = "res://scenes/Game.tscn"

func _ready() -> void:
	AudioManager.play_defeat_music()
	PointsLabel.text = str(PointManager.getPoints()) + " points collected"

func _on_play_pressed() -> void:
	PointManager.resetPoints()
	AudioManager.play_main_music()
	get_tree().change_scene_to_file(gameLvl)
