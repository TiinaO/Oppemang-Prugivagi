extends Sprite2D

@onready var inventory = $"../InventoryGui"


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if is_instance_valid(inventory) and inventory.isOpen:
				inventory.close()
			else:
				inventory.open()

