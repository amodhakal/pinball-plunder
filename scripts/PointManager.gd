extends Node

@onready var points = 0

func getPoints():
	return points
	
func addCollisionPoints():
	points += 10

func handleDefeat():
	#points -= 100  it does not make sense to lose points for losing
	return
