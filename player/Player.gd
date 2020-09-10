extends KinematicBody2D
class_name Player

var screen_size  # Size of the game window.

const UP = Vector2(0,-1)
const ACCELERATION = 70
const GRAVITY = 20
const JUMP_HEIGHT = -550
const MAX_SPEED = 200

export var speed : int = 200
export var movement : Vector2 = Vector2()
	
# warning-ignore:unused_argument
func _physics_process(delta):
	movement.y += GRAVITY
	var friction = false
		
	if Input.is_action_pressed("move_right"):
		#min retorna el valor minimo en dos valores
		movement.x= min(movement.x + ACCELERATION, MAX_SPEED)
		$Player_sprite.flip_h = false
		$Player_sprite.animation = "walk"

	elif Input.is_action_pressed("move_left"):
		movement.x= max(movement.x-ACCELERATION, -MAX_SPEED)
		$Player_sprite.flip_h = true
		$Player_sprite.animation = "walk"
	else:
		$Player_sprite.animation = "idle"
		friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed("move_jump"):
			movement.y = JUMP_HEIGHT
		if friction == true:
			movement.x = lerp(movement.x,0,0.5)
	else:
		if movement.y < 0:
			$Player_sprite.animation = "jump"
		else:	
			$Player_sprite.animation = "fall"
		if friction == true:
			movement.x = lerp(movement.x,0,0.02)

	movement = move_and_slide(movement, UP)

