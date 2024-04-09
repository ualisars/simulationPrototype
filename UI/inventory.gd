extends Control

var dragged_slot: Panel = null

@onready var grid_container: GridContainer = $InventoryContainer/GridContainer

var SlotClass: PackedScene = preload("res://UI/slot.tscn")

signal opened
signal closed

var is_open: bool = false :
	set(value):
		if value:
			visible = true
			is_open = true
			opened.emit()
		else:
			visible = false
			is_open = false
			closed.emit()


func _ready() -> void:
	for i in range(10):
		var slot = SlotClass.instantiate()
		grid_container.add_child(slot)
		
		if i == 0:
			slot.add_item("sword")
		elif i == 1:
			slot.add_item("bow")


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
