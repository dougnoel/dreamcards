class_name Card
extends Panel

#var card_back = preload("res://Cards/card_back.tscn")
#var card_front = preload("res://Cards/card_front.tscn")

#func _input(event):
#	if event is InputEventMouseButton:
#		if event.button_index == MOUSE_BUTTON_LEFT and event.is_action_released("click"):
#			var mycard = card_front.new()
#			get_parent().add_child(mycard.get_node("Card Front"))
#			mycard.show()
			

func _get_drag_data(_pos):
	var item_copy = Card.new()

	var preview = Control.new()
	preview.add_child(item_copy)
	item_copy.position = -0.5 * item_copy.size

	set_drag_preview(preview)

	hide()

#	self.position = pos
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	return self


#func _can_drop_data(_pos, _data):
##	if data is Card:
##		data.position = pos
#	return true
	
	
#func _drop_data(_pos, data):
##	if data is Card:
##		data.position = pos
##	else:
#	data.show()
#	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
