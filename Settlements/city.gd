extends Node3D

@onready var label_3d: Label3D = $"City Wall/Label3D"
@export var city_name: String = "City Name"

@onready var city_control: Control = $CityControl


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_3d.text = city_name
	name = city_name
	
	connect("body_entered", on_area_entered, CONNECT_DEFERRED)
	
func on_area_entered(body: Node) -> void:
	city_control.open_menu()
	print(body.name + " entered the city " + city_name)
