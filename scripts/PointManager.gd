extends Node

@onready var points = 0

func getPoints():
	return points
	
func addCollisionPoints():
	points += 10
	
func removePiratePoints():
	points -= 5

func resetPoints():
	points = 0
	
