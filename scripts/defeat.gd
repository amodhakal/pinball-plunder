extends Node2D

@onready var PlayBtn = $Play
@onready var HomeBtn = $Home
@onready var PointsLabel = $Points
var gameLvl = "res://scenes/Game.tscn"
var titleLvl = "res://scenes/Title.tscn"

func _ready() -> void:
	PointsLabel.text = str(PointManager.getPoints()) + " points collected"

func _on_play_pressed() -> void:
	PointManager.resetPoints()
	AudioManager.play_main_music()
	get_tree().change_scene_to_file(gameLvl)


func _on_button_pressed_home() -> void:
	PointManager.resetPoints()
	get_tree().change_scene_to_file(titleLvl)
