extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item
@onready var amount_text: Label = $CenterContainer/Panel/ItemAmount

var filled_slots: Array = [] #Täidetud sloti id
var current_slot_id: int = 0 #Praeguse kasutatava sloti id

func _ready():
	current_slot_id = 0
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
		
		#Kontroll, kas täidetud slotide hulgas on olemas slot, kuhu item läheb
		var is_slot_filled = filled_slots.find(slot.id) != -1
		if !is_slot_filled:
			slot.id = current_slot_id
			current_slot_id += 1
			
			var game_level = get_node("/root/GameLevel")
			game_level.update_slot_counter(1)
			filled_slots.append(slot.id)


