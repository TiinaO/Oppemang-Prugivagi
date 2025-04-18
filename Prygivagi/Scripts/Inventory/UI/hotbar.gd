extends Control

class_name HotbarClass

@export var visible_slots := 5
var slot_offset := 0 #Mitmendast slotist alustada

@onready var grid_container = $HBoxContainer/NinePatchRect/GridContainer
@onready var left_arrow = $HBoxContainer/LeftArrow as Button
@onready var right_arrow = $HBoxContainer/RightArrow as Button

#Arrow
@onready var left_arrow_sprite = $HBoxContainer/LeftArrow/CenterContainer/LeftArrow as Sprite2D
@onready var right_arrow_sprite = $HBoxContainer/RightArrow/CenterContainer/RightArrow as Sprite2D

#Arrow textures
var left_arrow_texture_active = preload("res://Assets/Menu/UI buttons=Vasakule.png")
var left_arrow_texture_disabled = preload("res://Assets/Menu/UI buttons=Vasakule_inactive, State=Inaktiivne.png")
var right_arrow_texture_active = preload("res://Assets/Menu/UI buttons=Paremale.png")
var right_arrow_texture_disabled = preload("res://Assets/Menu/UI buttons=Paremale, State=Inaktiivne.png")

@onready var inventory = Global.player_inventory
@onready var slots = grid_container.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Inventory uuendamisel uuendatakse ka hotbar
	inventory.update.connect(update_slots)
	inventory.update_arrows_requested.connect(update_arrows)
	#Noolte vajutus
	left_arrow.pressed.connect(_on_left_arrow_pressed)
	right_arrow.pressed.connect(_on_right_arrow_pressed)
	update_slots()
	update_arrows()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_left_arrow_pressed():
	if slot_offset > 0:
		slot_offset -= 1
		update_slots()
		update_arrows()

func _on_right_arrow_pressed():
	var filled_count = get_filled_slot_count()
	if slot_offset + visible_slots < filled_count:
		slot_offset += 1
		update_slots()
		update_arrows()

func update_slots():
	#var all_slots = grid_container.get_children()
	#for i in range(all_slots.size()):
		#var slot_index = i + slot_offset
		#all_slots[i].visible = slot_index < inventory.slots.size()
		#
		#if slot_index < inventory.slots.size():
			#all_slots[i].update(inventory.slots[slot_index])
		#else:
			#all_slots[i].update(InvSlot.new())
	var all_slots = grid_container.get_children()
	for i in range(all_slots.size()):
		var slot_index = i + slot_offset
		var slot_node = all_slots[i]

		if slot_index < inventory.slots.size():
			slot_node.update(inventory.slots[slot_index])
			slot_node.visible = true
		else:
			slot_node.update(InvSlot.new())
			slot_node.visible = false

func update_arrows():
	#Vaja saada täidetud slotide arv
	var filled_count = get_filled_slot_count()
	
	#Disable määramine ja texture muutus vastavalt aktiivsusele
	var can_go_left = slot_offset > 0
	var can_go_right = slot_offset + visible_slots < inventory.slots.size()
	
	left_arrow_sprite.texture = left_arrow_texture_active if can_go_left else left_arrow_texture_disabled
	right_arrow_sprite.texture =  right_arrow_texture_active if slot_offset + visible_slots < filled_count else right_arrow_texture_disabled
	
	#Button vajutamise võimaluse disablemine
	left_arrow.disabled = not can_go_left
	right_arrow.disabled = not can_go_right
	
func get_filled_slot_count() -> int:
	var count := 0
	for slot in inventory.slots:
		if slot.item and slot.amount > 0:
			count += 1
	return count
