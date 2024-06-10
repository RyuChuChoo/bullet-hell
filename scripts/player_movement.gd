extends CharacterBody2D

@onready var player_sprite = $player_sprite


const SPEED = 125.0
const ACCEL = 3.0

var input: Vector2


func get_input():
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	return input.normalized()
	
func _process(delta):
	var playerInput = get_input()
	velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	
	move_and_slide()
	
	if Input.is_action_pressed("left"):
			player_sprite.play("side")
			player_sprite.flip_h = false
	if Input.is_action_pressed("right"):
		player_sprite.play("side")
		player_sprite.flip_h = true
	if Input.is_action_pressed("up"):
		player_sprite.play("back forward")
	if Input.is_action_just_pressed("down"):
		player_sprite.play("walk forward")
	
