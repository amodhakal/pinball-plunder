extends RigidBody2D

@export var direction: int = -1 
@export var flip_speed: float = -10.0  
@export var return_speed: float = -5.0  
@export var resting_rotation: float = 0.0 

var flipping: bool = false

func _ready():
	set_deferred("angular_velocity", 0) 
	set_deferred("freeze", true) 
	await get_tree().process_frame 
	set_deferred("freeze", false) 

func _physics_process(delta):
	# Check if the flipper has reached the resting position
	if !flipping and abs(rotation - resting_rotation) < 0.1: 
		angular_velocity = 0 
	elif flipping and rotation - resting_rotation > 1.0:
		angular_velocity = 0
	else:
		if flipping:
			angular_velocity = direction * flip_speed 
		else:
			angular_velocity = -direction * return_speed 

func flip():
	flipping = true

func release():
	flipping = false
