extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "BallPhysics":
		return
	
	PointManager.removePiratePoints()
