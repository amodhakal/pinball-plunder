extends RigidBody2D

@export var bounce_factor: float = 1.0  # Controls the strength of bounce
@export var speed: float = 500  # Adjust the speed of the ball

var velocity = Vector2.ZERO

func _ready():
	# Set initial velocity
	velocity = Vector2(100, 300)  # Customize starting speed
	if Globals.gamemode == "normal":
		queue_free()

func _physics_process(delta):
	# Move the ball
	velocity = velocity.normalized() * speed  # Normalize to control consistent speed
	position += velocity * delta  # Apply the velocity to the ball's position
	
	# Check if the ball is outside the screen boundaries
	var screen_rect = get_viewport().get_visible_rect()

	if position.x < screen_rect.position.x:  # Ball goes beyond the left
		velocity.x = abs(velocity.x)  # Reverse X direction (bounce right)
	elif position.x > screen_rect.position.x + screen_rect.size.x:  # Ball goes beyond the right
		velocity.x = -abs(velocity.x)  # Reverse X direction (bounce left)

	if position.y < screen_rect.position.y:  # Ball goes beyond the top
		velocity.y = abs(velocity.y)  # Reverse Y direction (bounce down)
	elif position.y > screen_rect.position.y + screen_rect.size.y:  # Ball goes beyond the bottom
		velocity.y = -abs(velocity.y)  # Reverse Y direction (bounce up)
