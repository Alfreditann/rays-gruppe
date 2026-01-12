extends Node2D
@onready var skib = $VideoStreamPlayer

func _ready() -> void:
	print(skib.size)
