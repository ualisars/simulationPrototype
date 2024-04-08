extends Panel

var ItemClass = preload("res://UI/item.tscn")
var item: Control = null
var inventory_node: Control


func add_item(item_type):
	item = ItemClass.instantiate()
	item.add_icon(item_type)
	add_child(item)


func _get_drag_data(_at_position: Vector2) -> Variant:
	if get_child_count() == 0:
		return null

	var preview_item = item.duplicate()
	set_drag_preview(preview_item)
	
	remove_child(item)
	
	return self

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return get_child_count() == 0


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var new_item = data.item.duplicate()
	item = new_item
	add_child(new_item)
