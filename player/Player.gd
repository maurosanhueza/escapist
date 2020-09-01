extends KinematicBody2D
class_name Player

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		position.x += 1
	if Input.is_action_pressed("move_left"):
		position.x -= 1
	if Input.is_action_pressed("move_up"):
		position.y -= 1
	if Input.is_action_pressed("move_down"):
		position.y += 1
