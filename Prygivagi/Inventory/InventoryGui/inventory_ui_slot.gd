extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item
@onready var amount_text: Label = $CenterContainer/Panel/ItemAmount

var filled_slots: Array = [] #Täidetud sloti id
var current_slot_id: int = 0 #Praeguse kasutatava sloti id
var slot: InvSlot

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

func update(new_slot: InvSlot):
	slot = new_slot
	if !slot.item or slot.amount <= 0:
		itemSprite.visible = false
		amount_text.visible = false
	else:
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		amount_text.visible = true
		amount_text.text = str(slot.amount)
	
		
		#Kontroll, kas täidetud slotide hulgas on olemas slot, kuhu item läheb 
		# Muudab kotiikooni esimest nri Siin on vaja teha muudatusi!!
		"""var is_slot_filled = filled_slots.find(slot.id) != -1
		if !is_slot_filled:
			slot.id = current_slot_id
			current_slot_id += 1
			
		var game_level = get_node_or_null("/root/GameLevel")
		if game_level:
			game_level.update_slot_counter(1)
		filled_slots.append(slot.id)"""
			
func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_global_rect().has_point(get_global_mouse_position()):
			spawn_draggable_item()
		if slot.item and slot.amount > 0:
			#slot.amount -= 1 #Kasutati, kui lohistamise visuaali muutmisels. Tekitas probleemi koguse korrektse muutumise osas, kui korrektselt sorteeriti
			update(slot)  # See peab värskendama teksti ja peitma kui vaja


			
func spawn_draggable_item():
	if get_tree().current_scene.name != "sorting_level":
		print("Ei saa lohistada")
		return
		
	if slot.item == null:
		print("Pole eset, mida lohistada")
		return
	
	var item_scene = preload("res://Scenes/Levels/Sorting/sortable_item.tscn")
	var item_instance = item_scene.instantiate()
	
	var one_item := slot.item.duplicate()
	item_instance.item_data = one_item
	
	item_instance.origin_slot_node = self
	item_instance.global_position = get_global_mouse_position()
	item_instance.original_position = item_instance.global_position
	
	#Asjade loomiseks hotbarist ülesse poole
	var drag_layer = get_tree().current_scene.get_node("HotbarLayer/DragLayer")
	drag_layer.add_child(item_instance)
	
	itemSprite.visible = false
	amount_text.visible = false


func restore_item():
	#slot.amount += 1 # Kasutati siis, kui visuaal muutus ära lohistamisel | Hetkel ei muutu
	update(slot)

func remove_one_item():
	if slot.amount > 1:
		slot.amount -= 1
	else:
		slot.item = null
		slot.amount = 0
		Global.player_inventory.collapse_slots()
	# Sunnitakse uuendama inventari
	Global.player_inventory.emit_signal("update")
