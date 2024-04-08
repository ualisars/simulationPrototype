extends Control


func add_icon(item_type: String) -> void:
	var texture_rect: TextureRect = TextureRect.new()
	
	var width = 100
	var height = 100
	
	texture_rect.custom_minimum_size.x = width
	texture_rect.custom_minimum_size.y = height
	
	texture_rect.size.x = width
	texture_rect.size.y = height
	
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.mouse_filter = Control.MOUSE_FILTER_PASS
	
	
	match item_type:
		"sword":
			texture_rect.texture = load("res://icons/gladius.svg")
		"bow":
			texture_rect.texture = load("res://icons/bow-arrow.svg")
		_:
			pass
			
	add_child(texture_rect)
