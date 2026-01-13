extends CanvasLayer

func _ready() -> void:
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Escape"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true
			
func _on_return_to_game_pressed() -> void:
	visible = false
	get_tree().paused = false

#
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	
func _on_quit_to_main_menu_pressed() -> void:
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://tscn/main_menu.tscn")
