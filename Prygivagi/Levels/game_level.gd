extends Node2D

@onready var invCounter: Sprite2D = $CanvasLayer/InventoryInfo
@onready var itemsInInv : Label = $CanvasLayer/InventoryInfo/ItemsInInventory
var slotsUsedInInv: int = 0
var score = 0 # Skoori hoidja

func _ready():
	update_slot_counter(0)
	update_score(0) # Algse skoori seadistamine

func add_score(points):
	score += points
	update_score(score)

func update_score(new_score):
	var score_label = $UserInterface/GameUI/Score
	score_label.text = str(new_score)

#Seotud seljakoti sisu näitamisega
func _on_inventory_gui_closed():
	get_tree().paused = false

func _on_inventory_gui_opened():
	get_tree().paused = true 
	

#UI elemendi muutus - seljakotis olevate slotide hõivamine
func update_slot_counter(slots):
	slotsUsedInInv += slots
	itemsInInv.text = str(slotsUsedInInv)



