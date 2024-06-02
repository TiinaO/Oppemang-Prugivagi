extends Sprite2D

func _ready():
	# Luba sisendi sündmused
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Kontrolli, kas klikk oli sprite alal
			if get_rect().has_point(to_local(event.position)):
				_on_sprite_clicked()

func _on_sprite_clicked():
	get_tree().change_scene_to_file("res://Levels/game_level2.tscn")
	print("tere")

