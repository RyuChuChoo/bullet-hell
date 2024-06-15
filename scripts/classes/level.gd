class_name Level
extends Node

#a class name is a keyword that allows you to give a script a globally accesible name
#this makes it possible to create instances of the script from any other script without needing to specify the path
#to the script file

@export var level_id : int 

var level_data : LevelData

#we were able to use LevelManager because we made the levelmanager script global, so we can grab anything from it
func _ready() -> void:
	level_data = LevelManager.get_level_data_by_id(level_id)

func spawn_crab():
	var crab = preload("res://scenes/crab.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	crab.global_position = %PathFollow2D.global_position
	add_child(crab)

func _on_timer_timeout():
	spawn_crab()
