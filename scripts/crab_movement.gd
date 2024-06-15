extends CharacterBody2D

@onready var game_manager = $"/root/Main/2DScene/Level 1/game_manager"
@onready var player = $"/root/Main/2DScene/Level 1/player"
@onready var animation_player = $AnimationPlayer


var health = 1
var jumped = false
var jump_position = Vector2.ZERO

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 25
	move_and_slide()
	
func take_damage():
	health -= 1
	
	if health <= 0: 
		game_manager.add_point()
		animation_player.play("death")

func jump(area):
	if not jumped:
		jumped = true
		animation_player.play("jump")


func splash():
	if jumped:
		animation_player.play("splash")
		print("Crab splashed")
