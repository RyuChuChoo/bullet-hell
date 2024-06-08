extends Area2D

@onready var shooting_point = get_node("WeaponPivot/Watergun/ShootingPoint")

var Can_shoot = true

func shoot():
	if Can_shoot == true:
		const BULLET = preload("res://scenes/bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = shooting_point.global_position
		new_bullet.global_rotation = shooting_point.global_rotation
		shooting_point.add_child(new_bullet)
		Can_shoot = false

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		shoot()

func _on_timer_timeout():
	Can_shoot = true
