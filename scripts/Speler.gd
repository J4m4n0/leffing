extends CharacterBody2D

const SNELHEID = 200.0

func _physics_process(delta):
	var richting = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		richting.x += 1
	if Input.is_action_pressed("ui_left"):
		richting.x -= 1
	if Input.is_action_pressed("ui_down"):
		richting.y += 1
	if Input.is_action_pressed("ui_up"):
		richting.y -= 1
	
	velocity = richting.normalized() * SNELHEID
	move_and_slide()
