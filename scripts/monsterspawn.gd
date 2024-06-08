extends Node2D

func spawn_crab():
	var crab = preload("res://scenes/crab.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	crab.global_position = %PathFollow2D.global_position
	add_child(crab)


func _on_timer_timeout():
	spawn_crab()
