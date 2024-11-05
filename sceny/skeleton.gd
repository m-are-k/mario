extends CharacterBody2D
@onready var skeleton: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		skeleton.play("React")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#prawo lewo zmiana
	if Input.is_action_just_pressed("move_left"):
		skeleton.play("Walk")
		skeleton.flip_h = true
	elif Input.is_action_just_pressed("move_right"):
		skeleton.flip_h = false
		skeleton.play("Walk")
	elif direction == 0:
		skeleton.play("Idle")
	
	#animacje
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
