extends Node

@onready var ball = $BallPhysics
@onready var hardBall = $HardBallPhysics
@onready var left_flipper = $LeftFlipper
@onready var right_flipper = $RightFlipper
@onready var cannon = $DefaultCannon
@onready var hardCannon = $HardCannon
@onready var PointsLabel = $Points2
@onready var timer = $Timer
@onready var ship = $Area2D/Ship
@onready var explosion = $Explosion

var explosionTexture = preload("res://assets/explosion.png")
var defeatLvl = "res://scenes/Defeat.tscn"

func _process(delta: float) -> void:
	if Globals.gamemode == "normal":
		hardBall.visible = false
		hardCannon.visible = false
	PointsLabel.text = "Score: " + str(PointManager.getPoints())

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
	if Globals.gamemode == "normal" && body == ball:
		explosion.visible = true
		await get_tree().create_timer(2.0).timeout 
		get_tree().change_scene_to_file(defeatLvl)
		return
	else:
		explosion.visible = false
	
	if body == ball or body == hardBall && Globals.gamemode == "hard":
		explosion.visible = true
		await get_tree().create_timer(2.0).timeout 
		get_tree().change_scene_to_file(defeatLvl)
	else:
		explosion.visible = false
	


func _on_timer_timeout() -> void:
	cannon.visible = false
	if hardCannon.visible:
		hardCannon.visible = false
