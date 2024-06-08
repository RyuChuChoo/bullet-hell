extends Area2D

var Can_shoot = true

func shoot():
	if Can_shoot == true:
		const BULLET = preload("res://scenes/bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = %Watergun/ShootingPoint.global_position
		%Watergun/ShootingPoint.add_child(new_bullet)
		Can_shoot = false

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		shoot()

func _on_timer_timeout():
	Can_shoot = true
