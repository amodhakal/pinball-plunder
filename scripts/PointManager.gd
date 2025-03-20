extends Node

@onready var points = 0

func getPoints():
	return points
	
func addCollisionPoints():
	AudioManager.play_pickup()
	points += 10
	
func removePiratePoints():
	AudioManager.play_drop()
	points -= 5

func resetPoints():
	points = 0
	
