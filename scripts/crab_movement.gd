extends CharacterBody2D

@onready var game_manager = get_node("/root/Level 1/game_manager")
@onready var player = $"../player"

var health = 1


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 25
	move_and_slide()
	
func take_damage():
	health -= 1
	
	if health == 0: 
		game_manager.add_point()
		queue_free()
		

