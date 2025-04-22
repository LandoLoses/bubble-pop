extends Node2D
class_name Bubble

var speed: float = 100.0

func _process(delta):
	position.y -= speed * delta
