extends Node

@onready var ball = $BallPhysics
@onready var left_flipper = $LeftFlipper
@onready var right_flipper = $RightFlipper
var defeatLvl = "res://scenes/Defeat.tscn"

func _input(event):
	if event.is_action_pressed("flip_left"):
		left_flipper.flip()
	elif event.is_action_released("flip_left"):
		left_flipper.release()

	if event.is_action_pressed("flip_right"):
		right_flipper.flip()
	elif event.is_action_released("flip_right"):
		right_flipper.release()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if ( body == ball):
		get_tree().change_scene_to_file(defeatLvl)
	
