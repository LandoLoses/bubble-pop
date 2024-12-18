extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
const BUBBLE_UI = preload("res://BubbleUI/BubbleUI.tscn")

@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var score_ui: Label = $ScoreBoard/ScoreUI
@onready var bubble_node: Node2D = $BubbleNode
@onready var cat: Cat = $Cat

var score = 0
var popped: bool
var clicked_items: Array[Bubble]

func _ready() -> void:
	UpdateScore(0)
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25

func _process(delta: float) -> void:
	if not clicked_items.is_empty():
		var top_z: int = -99999
		var top_item: Bubble = null
		#clicked_items.sort()
		
		for item in clicked_items:
			print("item: ", item)
			if item.z_index > top_z:
				top_z = item.z_index
				top_item = item
		
		if top_item:
			top_item.Pop()
			clicked_items.clear()
	
	
	
	# TODO: Clean with an action later.
	if Input.is_physical_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		popped = false
		clicked_items.clear()

func PlaySound(bubble_position):
	audio_player.position = bubble_position
	audio_player.pitch_scale = randf_range(0.7, 1.3)
	audio_player.play()

func OnTimedOut():
	SpawnBubble()
	#audio_player.play()

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	#bubble_instance.cat = cat 
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_instance.scale *= randf_range(0.8, 1.2)
	bubble_instance.modulate = Color(randf_range(0.5, 1), randf_range(0.3, 1), randf_range(0.3, 1))
	bubble_node.add_child(bubble_instance)

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
