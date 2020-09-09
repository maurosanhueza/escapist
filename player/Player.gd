extends KinematicBody2D
class_name Player

var screen_size  # Size of the game window.

const UP = Vector2(0,-1)
const GRAVITY = 20
const JUMP_HEIGHT = -500

export var speed : int = 100
export var movement : Vector2 = Vector2()
	
# warning-ignore:unused_argument
func _physics_process(delta):
	movement.y += GRAVITY
	
	#if Input.is_action_pressed("move_up"):
	#	movement = Vector2(0,-speed)
	#	#$Player_sprite.flip_h = false
	#	$Player_sprite.animation = "jump"
		
	if Input.is_action_pressed("move_right"):
		#movement = Vector2(speed,0)
		movement.x = speed
		$Player_sprite.flip_h = false
		$Player_sprite.animation = "walk"

	#elif Input.is_action_pressed("move_down"):
	#	movement = Vector2(0,speed)
		
	elif Input.is_action_pressed("move_left"):
		#movement = Vector2(-speed,0)
		movement.x = -speed
		$Player_sprite.flip_h = true
		$Player_sprite.animation = "walk"
	else:
		#movement = Vector2(0,400)
		movement.x = 0
		$Player_sprite.animation = "idle"
	
	if is_on_floor():
		if Input.is_action_just_pressed("move_up"):
			#movement = Vector2(0,-400)	
			movement.y = JUMP_HEIGHT
		
	#move_and_collide(movement)
	movement = move_and_slide(movement, UP)

