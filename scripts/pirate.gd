extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "BallPhysics" && body.name != "HardBallPhysics":
		return
	
	PointManager.removePiratePoints()
