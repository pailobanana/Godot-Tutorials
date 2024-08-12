extends CharacterBody2D #accesses the file 
#New Scene>Other node>Character2d
# Sprite2D for character sprite
#CollisionShape 2D for hitboxes

signal health_depleted

var health = 100.0

func _physics_process(delta): #func = function declaration; 
	#physics_process (physics update) will be called if physics/gamestate to be updated
	var direction = Input.get_vector("move_left","move_right","move_up","move_down") 
	#var = stating of variables ; direction name of variable
	#Input.get_vector : Input = object to call built in functions for player input. Sets the controlls 
	#get_vector = the built in function of godot. It is the action of the input
	#("moveup,etc.") The input that was set in the settings that now is called
	#project>project settings>Input Map to set the controls.
	velocity = direction * 600
	#moving in input direction in 600 px/sec
	move_and_slide()
	#built in function in char2d
	if velocity.length() > 0.0:
	#length() will give the length of the vector as a decimal number
		get_node("HappyBoo").play_walk_animation() #get_node calls another nodes/script 
		#.play_walk_animation is a function inside the HappyBoo Script
	else: 
		$HappyBoo.play_idle_animation()
		#we use get_node is based on hierarchy,
		#inside the () you have to put the name of the child of the current node
		#if not inherited of the current node it wont work but if it is a child of the
		#the child of the current node it will work just change the directory ("name/name").
		#$nodename is a shortcut for get_node
		#$nodename or %nodename is better due to cleaner and performance and automatically 
		#finds the node within the hierarachy.
		
	const DAMAGE_RATE = 5.0 #creates a new variable that tells the damage over time you get
	var overlapping_mobs = %HurtBox.get_overlapping_bodies() # this variable is when you get touched by mobs
		#this is created from the Hurtbox Area 2D with CollisionShape
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		#%ProgressBar.max_value = 100
		if health <= 0.0:
			health_depleted.emit()
					#emit() has a same effect on most signals. 
					#
