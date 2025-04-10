class_name InventoryGui
extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: Inventory = preload("res://Inventory/InventoryItems/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

@onready var x_button: Button = $NinePatchRect/VBoxContainer/HBoxContainer2/X_Button

@onready var backpackSound: AudioStreamPlayer2D = $OpeningBackpackSound

func _ready():
	Global.player_inventory = inventory
	inventory.update.connect(update_slots)
	handle_connecting_signals()

func update_slots():
	for i in range(	min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

func open():
	backpackSound.play()
	await get_tree().create_timer(0.5).timeout
	visible = true
	isOpen = true
	opened.emit()

func close():	
	backpackSound.play()
	await get_tree().create_timer(0.5).timeout
	visible = false
	isOpen = false
	closed.emit()

func on_x_pressed():
	visible = false
	isOpen = false
	closed.emit()
	
func handle_connecting_signals() -> void:
	x_button.button_down.connect(on_x_pressed)


