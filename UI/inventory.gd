extends Control

var dragged_slot = null


func _notification(what:int)->void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		dragged_slot = get_viewport().gui_get_drag_data()
		
	if what == Node.NOTIFICATION_DRAG_END:
		if is_drag_successful():
			dragged_slot.item = null
		else:
			# add item to the original slot
			dragged_slot.add_child(dragged_slot.item)
		dragged_slot = null
