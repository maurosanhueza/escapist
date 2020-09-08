extends Position2D

func _ready():
	print("iniciando nuevo position enemigo")

func _on_Timer_timeout():
	print("_on_Timer_timeout()")
	var scene = load("res://enemies/Enemy.tscn")
	var enemy = scene.instance()
	add_child(enemy)
