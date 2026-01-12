extends Node2D

func _process(delta: float) -> void:
		get_tree().change_scene_to_file("res://tscn/pause_menu.tscn")
