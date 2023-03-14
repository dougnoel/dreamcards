extends Control

@export var card_front_1: PackedScene = preload("res://Cards/giant_growth_card.tscn")
@export var card_front_2: PackedScene = preload("res://Cards/blanchwood_armor_card.tscn")

var deck: Array
var hand = 0
var max_hand_size = 5

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
	hand += 1
	var my_card = deck.pick_random()
	
	match my_card:
		1:
			return card_front_1
		2:
			return card_front_2
	

func _draw_five_cards():
	while hand < max_hand_size:
		var instance = _draw_card().instantiate()
		$"Player Hand".add_child(instance)
		await get_tree().create_timer(0.3).timeout
		
func _on_deck_draw_card():
	_draw_five_cards()

