extends Area2D
class_name Bubble

var main: Main
#var cat: Cat

func _ready() -> void:
	input_event.connect(OnClicked)
	#cat.Mow()

func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < 0:
		queue_free()

func OnClicked(viewport, event, shape_id):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				#if main.popped == false:
					print("click")
					#main.popped = true
					main.clicked_items.append(self)
					#Pop()

func Pop():
	main.PlaySound(position)
	main.UpdateScore(3)
	#cat.position.x += 20
	queue_free()
