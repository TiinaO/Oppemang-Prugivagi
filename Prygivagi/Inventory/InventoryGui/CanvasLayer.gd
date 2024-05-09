extends CanvasLayer

@onready var inventory = $InventoryGui
@onready var inventoryInfo: Sprite2D = $InventoryInfo

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else:
			inventory.open()	
"""
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = event.position  # Saame hiire asukoha suhtes CanvasLayer'is
		var inventory_info_rect = Rect2(inventoryInfo.global_position, inventoryInfo.texture.get_size()) #See ei leia õiget kohta ülesse

		if inventory_info_rect.has_point(mouse_pos):
			if is_instance_valid(inventory) and inventory.isOpen:
				inventory.close()
			else:
				inventory.open()""" 
