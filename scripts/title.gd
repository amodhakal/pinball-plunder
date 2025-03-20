extends Node2D

var gameLvl = "res://scenes/Game.tscn"
@onready var playBtn = $Play

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Go to the Game
func _on_play_pressed() -> void:
	Globals.gamemode = "normal"
	get_tree().change_scene_to_file(gameLvl)

func _on_hard_pressed() -> void:
	Globals.gamemode = "hard"
	get_tree().change_scene_to_file(gameLvl)
