extends Sprite2D

func _ready() -> void:
	# If the gamemode is normal, remove the sprite node entirely.
	if Globals.gamemode == "normal":
		queue_free()
		
func _process(delta: float) -> void:
	pass  # Other frame-by-frame code can go here.
