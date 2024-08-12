extends Node2D

const SPEED = 60 # declaration of SPEED = 60 Pixels

var direction = 1
@onready var ray_cast_right = $r_raycast
@onready var ray_cast_left = $l_raycast
@onready var animated_sprite = $AnimatedSprite2D
#ray cast are nodes that serves as a sensor for collision in a direction.

func _process(delta): #delta is the amount of time that passes in frames.
	#delta applies depending on the framerate.
	# 'delta' is the elapsed time since the previous frame
	if ray_cast_right.is_colliding(): #if raycast right is hitting something it does:
		direction = -1 #direction is set to -1 to make enemy move to left
		animated_sprite.flip_h = true #the node animatedSprite of enemy flips when needs to change direction. 
		#flip_h flips the sprite node in horizontal axis
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += SPEED * direction * delta #moving in number of pixel * delta 
	
