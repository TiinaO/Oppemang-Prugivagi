extends Sprite2D

func _ready():
	# Luba sisendi sündmused
	set_process_input(true)
	print("Ready called for Sprite2D")

func _input(event):
	if event is InputEventMouseButton:
		print("Mouse button event detected")
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("Left mouse button pressed at position:", event.position)
			# Kontrolli, kas klikk oli sprite alal
			var local_pos = to_local(event.position)
			print("Local position:", local_pos)
			if get_rect().has_point(local_pos):
				print("Click within sprite bounds")
				_on_sprite_clicked()
			else:
				print("Click outside sprite bounds")
		else:
			print("Not a left mouse button press")
	else:
		print("Not a mouse button event")

func _on_sprite_clicked():
	print("tere")
