extends Control

@onready var texture_rect: TextureRect = $TextureRect
var item_type: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randi() % 2 == 0:
		item_type = "sword"
		texture_rect.texture = load("res://icons/gladius.svg")
	else:
		item_type = "bow"
		texture_rect.texture = load("res://icons/bow-arrow.svg")
