extends Panel

var ItemClass = preload("res://UI/item.tscn")
var item: Control = null
var inventory_node: Control


func _ready() -> void:
	connect("gui_input", on_gui_input, CONNECT_DEFERRED)
	inventory_node = find_parent("Inventory")
	
	if randi() % 2 == 0:
		item = ItemClass.instantiate()
		add_child(item)
		

func on_gui_input(event: InputEvent):
	if event.is_action_pressed("mouse_left_click"):
		pick_from_slot()
	if event.is_action_released("mouse_left_click"):
		put_into_slot()
		

func pick_from_slot() -> void:
	inventory_node.hold_item()
	
func put_into_slot() -> void:
	inventory_node.place_item()

