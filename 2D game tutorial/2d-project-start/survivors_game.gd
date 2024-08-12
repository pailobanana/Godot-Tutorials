extends Node2D


	
func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf() #randf produces random number between 0-1
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_tree():
	var spawn_tree = preload("res://pinetree.tscn").instantiate()
	%PathFollow2D.progress_ratio = 1 #randf produces random number between 0-1
	spawn_tree.global_position = %PathFollow2D.global_position
	add_child(spawn_tree)

func _on_timer_timeout():
	spawn_mob()



func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	
