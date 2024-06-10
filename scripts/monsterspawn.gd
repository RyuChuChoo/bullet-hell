extends Node2D

@onready var score_label = $score_label
var score = 0

func spawn_crab():
	var crab = preload("res://scenes/crab.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	crab.global_position = %PathFollow2D.global_position
	add_child(crab)


func _on_timer_timeout():
	spawn_crab()
