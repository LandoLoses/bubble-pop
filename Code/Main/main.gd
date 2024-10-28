extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var score_ui: Label = $Scoreboard/ScoreUI
@onready var bubble_node: Node2D = $BubbleNode

var score = 0 
func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25

func PlaySound(bubble_position):
	audio_player.position = bubble_position
	audio_player.pitch_scale = randf_range(0.1, 1.3)
	audio_player.play()
	
func OnTimedOut():
	SpawnBubble()
	 

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_instance.scale *= randf_range(0.5, 1.8)
	bubble_instance.modulate = Color(randf_range(0.7,1), randf_range(0,1), randf_range(0.9,1))
	bubble_node.add_child(bubble_instance)

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
