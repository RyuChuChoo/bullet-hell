extends Area2D

@onready var player_movement = get_node("/root/Level 1/player")

var jumped = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Game over")



func _on_area_entered(area):
	if area.is_in_group("borders_sides"):
		jumped = true
		print("jumped sides")
		
	elif area.is_in_group("borders_sidents"):
		jumped = true
		print("jumped sidents")
