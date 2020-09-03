extends KinematicBody2D
class_name Player

export var speed : int = 4  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		var movement : Vector2 = Vector2(0,-speed)
		move_and_collide(movement)
		#position.y -= speed	
	if Input.is_action_pressed("move_right"):
		var movement : Vector2 = Vector2(speed,0)
		move_and_collide(movement)
		#position.x += speed
	if Input.is_action_pressed("move_down"):
		var movement : Vector2 = Vector2(0,speed)
		move_and_collide(movement)
		#position.y += speed		
	if Input.is_action_pressed("move_left"):
		var movement : Vector2 = Vector2(-speed,0)
		move_and_collide(movement)
		#position.x -= speed


