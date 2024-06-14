class_name MainMenu
extends Control

func _on_play_pressed():
	LevelManager.load_level(1)
	deactive()


func _on_controls_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()

func deactive() -> void:
	hide()
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
func activate() -> void:
	show()
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
