extends Node2D

func _ready():
	for tilemap in get_tree().get_current_scene().get_children():
		if tilemap is TileMap:
			if not tilemap.tile_set:
				print("TileMap ", tilemap.name, " has no TileSet assigned!")
