extends Control


func _can_drop_data(_pos, _data):
#	if data is Card:
#		data.position = pos
	return true


func _drop_data(pos, data):
#	if data is Card:
#		data.position = pos
#	else:
	data.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
