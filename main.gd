extends Control

@export var card_front: PackedScene = preload("res://Cards/giant_growth_card.tscn")

var deck: Array
var hand = 0

func _ready():
	deck = [1,2,1,2,1,2,1,2,1]


func _can_drop_data(_pos, _data):
	return true


func _drop_data(pos, data):
	data.position = pos
	data.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Returns a random card from the deck
func _draw_card():
	pass
	

func _on_deck_draw_card():
	var instance = card_front.instantiate()
	$"Player Hand".add_child(instance)

