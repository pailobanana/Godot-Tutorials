extends Area2D


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	#this function will find all other character 2d and lists it in an array 
	if enemies_in_range.size() >0:#if the listed enemy is greater than 0 it will find it 
		var target_enemy = enemies_in_range.front() 
	#.front() gets the first element in the array
	#[0] same gets the first one in the array
	#this finds the target in the range of the Collisionshape2D
		look_at(target_enemy.global_position)
	#allows to look at a point 


func shoot():
	#load() it will not load unless the line is executed.
	#preload() it will get preloaded at the start of the game , static.
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate() # this creates new instance of the called scene.
	#instantiate enables that creation of new instance
	new_bullet.global_position = %Shootingpoint.global_position#this moves the bullet to the %shootingpoint position.
	new_bullet.global_rotation = %Shootingpoint.global_rotation#this moves the bullet to the %shootingpoint position.
	%Shootingpoint.add_child(new_bullet) #this makes the bullet become a child of shooting point when instance is made.
	

func _on_timer_timeout():
	shoot()
