extends CharacterBody2D


const tile_size: Vector2 = Vector2(32,32)


@onready var anim = $AnimatedSprite2D


var target_pos: Vector2
var move_dir := Vector2.ZERO
var moving:= false
var sprite_node_pos_tween: Tween
var last_dir := dir
var dir := Vector2.ZERO
func _physics_process(delta: float) -> void:
	if not moving:
		read_input()
		
		
	
		
func read_input():
	var dir := Vector2.ZERO
	if Input.is_action_pressed("move_up") and !$up.is_colliding():
		dir = Vector2.UP
		anim.play("Back")
			
	elif Input.is_action_pressed("move_down") and !$down.is_colliding():
		dir = Vector2.DOWN
		anim.play("Front")
			
	elif Input.is_action_pressed("move_left") and !$left.is_colliding():
		dir = Vector2.LEFT
		anim.play("Left")
	elif Input.is_action_pressed("move_right") and !$right.is_colliding():
		dir = Vector2.RIGHT
		anim.play("Right")
	else:
		match last_dir:
			Vector2.RIGHT:
				anim.play("Rigth_idle")
			Vector2.LEFT:
				anim.play("Left_idle")
			Vector2.UP:
				anim.play("Back_idle")
			Vector2.DOWN:
				anim.play("Front_idle")

	if dir != Vector2.ZERO:
		start_move(dir)
func start_move(dir: Vector2):
	last_dir = dir
	moving = true
	target_pos = global_position + dir * tile_size

	var tween := create_tween()
	tween.tween_property(
		self,
		"global_position",
		target_pos,
		0.18
	)

	tween.finished.connect(func():
		global_position = target_pos
		moving = false
	)
func play_idle():
	if Input.is_action_just_pressed("ui_up"):
			anim.play("Back_idle")
	elif Input.is_action_just_pressed("ui_down"):
			anim.play("Front_idle")
	elif Input.is_action_just_pressed("ui_left"):
			anim.play("Left_idle")
	elif Input.is_action_just_pressed("ui_right"):
			anim.play("Rigth_idle")
	
	
