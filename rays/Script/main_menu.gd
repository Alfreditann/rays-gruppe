extends Control


func _on_start_game_pressed() -> void: 
	get_tree().change_scene_to_file("res://tscn/level_1.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_quit_game_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
