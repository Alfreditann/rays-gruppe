extends CharacterBody2D


const tile_size: Vector2 = Vector2(32,32)


@onready var anim = $AnimatedSprite2D


var sprite_node_pos_tween: Tween

func _physics_process(delta: float) -> void:
	if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running():
		if Input.is_action_pressed("move_up") and !$up.is_colliding():
			_move(Vector2(0,-1))
			anim.play("Back")
			
		elif Input.is_action_pressed("move_down") and !$down.is_colliding():
			_move(Vector2(0,1))
			anim.play("Front")
			
		elif Input.is_action_pressed("move_left") and !$left.is_colliding():
			_move(Vector2(-1,0))
			anim.play("Left")
		elif Input.is_action_pressed("move_right") and !$right.is_colliding():
			_move(Vector2(1,0))
			anim.play("Right")
			
		else:
			if $AnimatedSprite2D.animation == "Front":
				anim.play("Front_idle")
			elif $AnimatedSprite2D.animation == "Back":
				anim.play("Back_idle")
			elif $AnimatedSprite2D.animation == "Left":
				anim.play("Left_idle")
			elif $AnimatedSprite2D.animation == "Right":
				anim.play("Rigth_idle")
			
	
	#if Input.is_action_just_pressed("ui_up"):
		
func _move(dir: Vector2):
	global_position += dir * tile_size
	$AnimatedSprite2D.global_position -= dir * tile_size
	
	if sprite_node_pos_tween:
		sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($AnimatedSprite2D, "global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)

	
