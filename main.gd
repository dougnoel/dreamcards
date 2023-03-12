extends Control

@export var card_front_scene: PackedScene = preload("res://Cards/card.tscn")


func _ready():
	pass # Replace with function body.


func _can_drop_data(_pos, _data):
#	if data is Card:
#		data.position = pos
	return true


func _drop_data(pos, data):
	data.position = pos
	data.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_deck_draw_card():
	var instance = card_front_scene.instantiate()
	await get_tree().process_frame
	instance.scale = instance.scale * 0.5
	instance.position = Vector2(500.0, 200.0)
	$"Player Hand".add_child(instance)

