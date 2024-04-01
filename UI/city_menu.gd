extends Control

@export var city: Node3D

@onready var city_name_label: Label = $MarginContainer/ColorRect/city_name_label
@onready var close_button: Button = $MarginContainer/BoxContainer3/CloseButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	city_name_label.text = city.city_name
	close_button.pressed.connect(close_menu)
	

func close_menu():
	print("close menu")
	get_tree().paused = false
	hide()
	

func open_menu():
	print("open city menu")
	get_tree().paused = true
	show()
