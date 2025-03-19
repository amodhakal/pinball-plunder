extends Node2D

@onready var PlayBtn = $Play
@onready var PointsLabel = $Points
var gameLvl = "res://scenes/Game.tscn"

func _ready() -> void:
	PointManager.handleDefeat()
	PointsLabel.text = str(PointManager.getPoints()) + " points collected"

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(gameLvl)
