extends Area2D

var travelled_distance = 0
#initial travel time of the bullet
func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
#Vector2.RIGHT is equal to (1,0) is horizontal value
	position += direction * SPEED * delta
	#This moves the bullet forward based on rotation
	#sets position in the map to constantly moving
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free() #this will destroy the bullet
	

#from signal that godot provides 
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"): 
		#has_method a function that godot provides to all nodes
		#has_method("name of function you want to check")
		body.take_damage() #ductyping checking the properties and calls it.
