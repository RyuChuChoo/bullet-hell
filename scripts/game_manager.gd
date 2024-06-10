extends Node

var score = 0
@onready var score_number = $"../labels/score_label/score_number"


func add_point():
	score += 1
	score_number.text = str(score)

