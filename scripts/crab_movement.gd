extends CharacterBody2D

@onready var game_manager = get_node("/root/Level 1/game_manager")
@onready var player = $"../player"
@onready var animation_player = $AnimationPlayer

var health = 1
var jumped = false
var jump_position = Vector2.ZERO
var wall = ""
var print = false

func _physics_process(delta):
	var current_position = global_position
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 25
	move_and_slide()
	#if jumped:
		#var value_x = 0
		#var value_y = 0
		#var down_position = Vector2.ZERO
		#if wall == "leftright":
			#if current_position.x < 0:
				#value_x = 7
			#else:
				#value_x = -7
			#down_position = get_point_at_x([player.global_position, jump_position], value_x + jump_position.x)
				#
		#elif wall == "topbottom":
			#if current_position.y > 0:
				#value_y = 8.5
			#else:
				#value_y = -8.5
			#down_position = get_point_at_y([player.global_position, jump_position], value_y + jump_position.y)
		#if not print:
			#print(jump_position)
			#print(down_position)
		#print = true
		#if current_position.distance_to(down_position) < 0.5:
			#animation_player.play("jumpdown")
	
func take_damage():
	health -= 1
	
	if health <= 0: 
		game_manager.add_point()
		animation_player.play("death")

func jump(area):
	jump_position = global_position
	if area == "leftright":
		wall = "leftright"
		jumped = true
		animation_player.play("jump")
		
	elif area == "topbottom":
		wall == "topbottom"
		jumped = true
		animation_player.play("jump")

func splash(area):
	if area == "leftright":
		animation_player.play("splash")
		
	elif area == "topbottom":
		animation_player.play("splash")

#func get_point_at_x(points: Array, target_x: float) -> Vector2:
	#var x1 = points[0].x
	#var y1 = points[0].y
	#var x2 = points[1].x
	#var y2 = points[1].y
#
	#if x1 == x2:
		#return Vector2(target_x, y1)
#
	#var target_y = y1 + ((y2 - y1) * (target_x - x1)) / (x2 - x1)
#
	#if (target_x < min(x1, x2)) or (target_x > max(x1, x2)):
		#return Vector2(target_x, y1)
#
	#return Vector2(target_x, target_y)
#
#
#
#func get_point_at_y(points: Array, target_y: float) -> Vector2:
	#var x1 = points[0].x
	#var y1 = points[0].y
	#var x2 = points[1].x
	#var y2 = points[1].y
#
	#if y1 == y2:
		#return Vector2(x1, target_y)
#
	#var target_x = x1 + ((x2 - x1) * (target_y - y1)) / (y2 - y1)
#
	#if (target_y < min(y1, y2)) or (target_y > max(y1, y2)):
		#return Vector2(x1, target_y)
#
	#return Vector2(target_x, target_y)
