extends Node

#arrays is like a bunch of data together, mutiple thingy mabobs
#when variables use : its just defining the type of variable like a number(int), string, or boolean(like true or false)
var levels : Array[LevelData]

var main_scene : Node2D = null
var loaded_level : Level = null

#Void basiclly means doing the function but not returning anything to you personally
#idk its complicated it make my brain go ouchie
func unload_level() -> void:
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()

	loaded_level = null

#when a string has something like %s, it means to put in a varible in that space, below its taking the level_id into the string
func load_level(level_id : int) -> void:
	print("loading level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
	
	var level_path = "res://scenes/%s.tscn" %level_data.level_path
	var level_res := load(level_path)
	
	if level_res:
		loaded_level = level_res.instantiate()
	
		main_scene.add_child(loaded_level)
	else:
		print("Level does not exist")

#I think -> means return, so if its void, we want it to return nothing, while LevelData we want it to return that
#which levels = leveldata at the top
func get_level_data_by_id(id : int) -> LevelData:
	var level_to_return : LevelData = null
	
	for lvl : LevelData in levels:
		if lvl.level_id == id:
			level_to_return = lvl
	
	return level_to_return
	
