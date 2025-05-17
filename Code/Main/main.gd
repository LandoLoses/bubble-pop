extends Node
class_name Main

const BUBBLE: PackedScene = preload("res://Bubble/Bubble.tscn")

@onready var timer = $Timer
@onready var audio = $Audio
@onready var score_ui: Label = $UI/ScoreUI

var score: int = 0

func _ready():
	timer.timeout.connect(OnTimedOut)
	score_ui.text = str(score)

func _unhandled_key_input(event):
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			get_tree().quit()

func OnTimedOut():
	var rando: int = randi_range(0, get_viewport().size.x)
	var bubble_node = BUBBLE.instantiate()
	bubble_node.main = self
	bubble_node.audio = audio
	bubble_node.position.x = rando
	bubble_node.position.y = get_viewport().size.y
	add_child(bubble_node)


func IncreaseScore():
	score += 1
	score_ui.text = str(score)
