extends RigidBody2D

@export var direction: int = -1  # 1 for right flipper, -1 for left flipper
@export var flip_speed: float = 10.0  
@export var return_speed: float = 5.0  
@export var resting_rotation: float = 0.0  # Default rotation position (resting position)

var flipping: bool = false

func _ready():
	set_deferred("angular_velocity", 0)  # Stop unwanted motion
	set_deferred("freeze", true)  # Freeze at start to prevent movement
	await get_tree().process_frame  # Wait one frame
	set_deferred("freeze", false)  # Unfreeze to enable physics

func _physics_process(delta):
	# Check if the flipper has reached the resting position
	if !flipping and abs(rotation - resting_rotation) < 0.1:  # Rotation is close to resting position
		angular_velocity = 0  # Stop applying angular velocity once resting position is reached
	elif flipping and abs(rotation - resting_rotation) > 1.0:
		angular_velocity = 0
	else:
		if flipping:
			angular_velocity = direction * flip_speed  # Move flipper upwards
		else:
			angular_velocity = -direction * return_speed  # Return to resting position

func flip():
	flipping = true

func release():
	flipping = false
