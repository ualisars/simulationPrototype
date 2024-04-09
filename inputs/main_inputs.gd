extends CanvasLayer

@export var inventory_ui: Control


		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("OpenInventory"):
		inventory_ui.is_open = !inventory_ui.is_open
