extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -250.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_audio = $jump

func _physics_process(delta): 
	#process reads how the function runs. Physics process is great for physics bodies
	# Add the gravity.
	#Actions are commands that reacts to the input map in the project setting.
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		animated_sprite.play("jump")
		jump_audio.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction: 0 , -1 , 1
	
	
	var direction = Input.get_axis("Left", "Right")
	#Flip the sprite
	if direction >0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
