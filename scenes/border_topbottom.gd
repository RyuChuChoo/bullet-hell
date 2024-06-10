extends Area2D

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.jump("topbottom")

func _on_body_exited(body):
	if body.is_in_group("enemies"):
		body.splash("topbottom")