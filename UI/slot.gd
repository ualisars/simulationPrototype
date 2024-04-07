extends Panel

var ItemClass = preload("res://UI/item.tscn")
var item: Control = null
var inventory_node: Control


func _ready() -> void:
	if randi() % 2 == 0:
		item = ItemClass.instantiate()
		add_child(item)
		

func _notification(what:int)->void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		# Drag data is available (populated by our _get_drag_data() function for example)
		var data = get_viewport().gui_get_drag_data()
		# Use the drag data
	if what == Node.NOTIFICATION_DRAG_END:
		# Drag data is no longer available and has been disposed already
		print("Drag ended. Success: ", get_viewport().gui_is_drag_successful())


func _get_drag_data(_at_position: Vector2) -> Variant:
	print("drag data")
	var preview_item = item.duplicate()
	set_drag_preview(preview_item)
	
	remove_child(item)
	
	return self

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return item == null


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	print("drop data")
	print("current slot", name)
	print("from slot", data.name)
	print("data item", data.item.item_type)
	var new_item = data.item.duplicate()
	add_child(new_item)
