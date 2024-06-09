extends Area2D

@onready var player_movement = get_node("/root/Level 1/player")

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_movement.game_over()
		


