extends Control

@onready var inventory = Global.player_inventory
@onready var slots = $NinePatchRect/GridContainer.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Inventory uuendamisel uuendatakse ka hotbar
	inventory.update.connect(update_slots)
	update_slots()

func update_slots():
	for i in range(slots.size()):
		if i < inventory.slots.size():
			slots[i].update(inventory.slots[i])
		else:
			slots[i].update(InvSlot.new())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
