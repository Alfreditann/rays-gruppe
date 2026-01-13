extends StaticBody2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	#1 Remove the monster when light hits it
	if area.name == "Area2D":
		queue_free()	
		#2 Change scene to win screen
		get_tree().change_scene_to_file("res://tscn/win_screen.tscn")


func _on_monster_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
