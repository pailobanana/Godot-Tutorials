extends Area2D

@onready var asswecan = $asswecan
@onready var win_fx = $WinFX
@onready var timer = $Timer


var player = null  # To keep track of the player node

func _on_body_entered(body): 
	#when body(2dbodynode aka player 2dnode) hits the killzone it activates:
	print("You Won!")
	win_fx.play("win")
	timer.start()
	
func _on_timer_timeout(): #when timer node stops it activates:
	get_tree().reload_current_scene()
