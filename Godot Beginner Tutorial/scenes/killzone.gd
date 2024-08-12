extends Area2D

@onready var timer = %Timer
@onready var audio_hurt = $AudioStreamPlayer2D


func _on_body_entered(body): 
	#when body(2dbodynode aka player 2dnode) hits the killzone it activates:
	print("You Died!")
	audio_hurt.play()
	Engine.time_scale = 0.3 #changes the time of the game
	body.get_node("CollisionShape2D").queue_free() #accesses the player body; .get_node finds the Collision shape 2d and removes that node
	timer.start()

func _on_timer_timeout(): #when timer node stops it activates:
	Engine.time_scale = 1# returns time to normal. 
	get_tree().reload_current_scene() #it reloads the game...
	#get_tree() tries to use the current scene and reload_current_scene() reloads the scene
 
