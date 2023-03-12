class_name Deck
extends Panel

signal draw_card()


func _on_card_back_art_pressed():
	emit_signal("draw_card")
