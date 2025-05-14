extends Area2D
class_name Bubble

var audio: AudioStreamPlayer2D 
var speed: float = 200.0 # px / sec.

func _ready():
	input_event.connect(OnClicked) 
	
func _process(delta):
	position.y -= speed * delta
	if position.y < 0:
		queue_free()

func OnClicked(_viewport, event, _shape):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				Pop()
				print("Player clicked down.")
			else:
				print("Player clicked up.")
				
func Pop():
	audio.position = position
	audio.play()
	queue_free()
