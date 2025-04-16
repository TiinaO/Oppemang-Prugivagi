extends CanvasLayer

@onready var inventory = $InventoryGui
@onready var inventoryInfo: Sprite2D = $InventoryInfo

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else:
			inventory.open()	
