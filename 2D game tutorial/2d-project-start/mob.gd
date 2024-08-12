extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")
#this will get the player node
func _ready():
	$Slime.play_walk()
#func _ready():
	#ready ensures that given nodes and children is created before funcitoning
	#player = get_node("/root/Game/Player")
	#onready is a shortcut for this.

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	#this variable will get the position of the player
	#Global position where the mob is in the world
	#direction_to will calculculate the direction towards something ()
	#player.global_position will always locate anywhere the player is 
	velocity = direction * 300.0
	move_and_slide() 
	#built in to move in godot
	
func take_damage():
	health -= 1
	$Slime.play_hurt()

	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
	


