extends Area2D

@onready var player_movement = get_node("/root/Level 1/player")
@onready var game_over_title = get_node("/root/Level 1/labels/game_over_title")
@onready var score_label = get_node("/root/Level 1/labels/score_label")
@onready var score_number = get_node("/root/Level 1/labels/score_label/score_number")
@onready var final_score_number = get_node("/root/Level 1/labels/game_over_title/final_score_number")
@onready var Level_1 = get_node("/root/Level 1")

var is_game_over = false
var jumped = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		game_over()


func _on_area_entered(area):
	if area.is_in_group("borders_sides"):
		jumped = true
		print("jumped sides")
		
	elif area.is_in_group("borders_sidents"):
		jumped = true
		print("jumped sidents")

func game_over():
	is_game_over = true 
	game_over_title.visible = true
	score_label.visible = false
	final_score_number.text = score_number.text
	get_tree().paused = true

func _process(delta):
	if is_game_over == true:
		if Input.is_action_pressed("space"):
			get_tree().paused = false
			get_tree().reload_current_scene()
			
