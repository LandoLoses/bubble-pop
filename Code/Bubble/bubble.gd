extends Area2D
class_name Bubble

var main: Main

func _ready() -> void:
	input_event.connect(OnClicked)
	

func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < 0:
		queue_free()

func OnClicked(viewport, event, shape_id): 
	if event is InputEventMouseButton: 
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				print("clicked me!")
				Pop()


func Pop(): 
	main.PlaySound(position)
	main.UpdateScore(3)
	queue_free()
