extends TextureRect


func _get_drag_data(_pos):
	if get_child_count() > 0:
		var item = get_child(0)
		
		var item_copy = TextureRect.new()
		item_copy.texture = item.texture
		item_copy.size = item.size
		item_copy.custom_minimum_size = item.custom_minimum_size
		item_copy.layout_mode = item.layout_mode
		item_copy.anchors_preset = item.anchors_preset
		item_copy.stretch_mode = item.stretch_mode
		item_copy.position = item.position
		
		var preview = Control.new()
		preview.add_child(item_copy)
		item_copy.position = -0.5 * item_copy.size
		
		set_drag_preview(preview)
		
		item.hide()
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		return item


func _can_drop_data(pos, data):
	if data is Card:
		data.position = pos
	return true


func _drop_data(_pos, data):
	data.get_parent().remove_child(data)
	add_child(data)
	data.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
