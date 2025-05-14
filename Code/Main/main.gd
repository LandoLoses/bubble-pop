extends Node
class_name Main

const BUBBLE: PackedScene = preload("res://Bubble/Bubble.tscn")
@onready var timer = $Timer
@onready var audio = $Audio

func _ready():
	timer.timeout.connect(OnTimedOut)

func OnTimedOut():
	var rando: int = randi_range(0, get_viewport().size.x)
	var bubble_node = BUBBLE.instantiate()
	bubble_node.audio = audio
	bubble_node.position.x = rando
	bubble_node.position.y = get_viewport().size.y
	add_child(bubble_node)
