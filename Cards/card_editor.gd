extends Control


func _on_save_button_pressed():
	$SaveFileDialog.popup_centered()


func _on_save_file_dialog_file_selected(path):
	# Wait until the frame has finished before getting the texture.
	await RenderingServer.frame_post_draw

	# Get the viewport image.
	var img = get_viewport().get_texture().get_image()
	
	var card = $Card
	# Crop the image so we only have canvas area.
	var cropped_image = img.get_region(Rect2(card.position, card.size))

	# Save the image with the passed in path we got from the save dialog.
	cropped_image.save_png(path)
