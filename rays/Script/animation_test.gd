extends Node2D

@onready var video_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	# Preload the OGV video into memory
	var video_stream = load("res://Animations/Tower long.ogv")  # preloads at scene load
	video_player.stream = video_stream
	video_player.play()
