extends Resource

class_name Inventory

signal update

#@export var items: Array[InventoryItem]
@export var slots: Array[InvSlot]

func insert(item: InventoryItem):
	var itemslots = slots.filter(func(slot): return slot.item ==item)
	if !itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	update.emit()

func collapse_slots():
	for i in range(slots.size()):
		if not slots[i].item or slots[i].amount <= 0:
			# Leia järgmine mitte-tühi slot
			for j in range(i + 1, slots.size()):
				if slots[j].item and slots[j].amount > 0:
					# Nihuta järgmine mitte-tühi slot vasakule
					slots[i].item = slots[j].item
					slots[i].amount = slots[j].amount

					# Tühjenda vana koht
					slots[j].item = null
					slots[j].amount = 0
					break
