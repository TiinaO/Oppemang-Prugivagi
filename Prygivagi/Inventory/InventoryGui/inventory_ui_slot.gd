extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item
@onready var amount_text: Label = $CenterContainer/Panel/ItemAmount

"""
func update(item: InventoryItem):
	if !item:
		itemSprite.visible = false
	else:
		itemSprite.visible = true
		itemSprite.texture = item.texture
"""

func update(slot: InvSlot):
	if !slot.item:
		itemSprite.visible = false
		amount_text.visible = false
	else:
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		amount_text.visible = true
		amount_text.text = str(slot.amount)
