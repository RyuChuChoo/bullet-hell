extends Node

@onready var score_number = $"../score_number"
var score = 0


func add_point():
	score += 1
	print(score)
	score_number.text = str(score)