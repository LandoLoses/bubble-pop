extends Node2D

@onready var button: Button = $Button
@onready var texture_button: TextureButton = $TextureButton

var main: Main

func _ready() -> void:
	button.pressed.connect(OnClicked)
	texture_button.button_down.connect(OnButtonDown)
	
func OnButtonDown():
	print("Down Donw")
	Pop()

func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < 0:
		queue_free()

func OnClicked():
	print("click")
	Pop()

func Pop():
	main.PlaySound(position)
	main.UpdateScore(3)
	queue_free()
