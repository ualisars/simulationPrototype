extends Control

@onready var texture_rect: TextureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randi() % 2 == 0:
		texture_rect.texture = load("res://icons/gladius.svg")
	else:
		texture_rect.texture = load("res://icons/bow-arrow.svg")
