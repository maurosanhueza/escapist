extends KinematicBody2D

const UP = Vector2(0,-1)
const ACCELERATION = 70
const GRAVITY = 20

export var speed : int = 200
export var movement : Vector2 = Vector2()

func _physics_process(delta):
	movement.y += GRAVITY
	var friction = false

	movement = move_and_slide(movement, UP)	
