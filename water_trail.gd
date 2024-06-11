extends Line2D

var point_length = 50
var point_velocity = Vector2()

func _process(delta):
	#this is so it always goes back to the same postion
	global_position = Vector2(0,0)
	global_rotation = 0
	
	#this is so it follows the player
	point_velocity = get_parent().global_position
	
	add_point(point_velocity)
	while get_point_count()>point_length:
		remove_point(0)
