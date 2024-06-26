extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 500
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	#destorys the bullet
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()

func _on_area_entered(area):
	if area.is_in_group("border"):
		queue_free()
