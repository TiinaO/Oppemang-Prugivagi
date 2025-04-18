extends Node2D

@onready var spawn_area = $HotbarLayer/SpawnArea
var item_scene = preload("res://Scenes/Levels/Sorting/sortable_item.tscn")

@onready var pause_button = $"UI elements/MarginContainer/HBoxContainer/PauseButton"
@onready var pause_menu = $PauseMenu/Pause_menu
@onready var next_level_arrow = $Sprite2D as Sprite2D

func _ready():
	#Pause menüü toimimine
	pause_button.pressed.connect(_on_pause_button_pressed)
	pause_menu.pause_closed.connect(_on_pause_closed)
	pause_menu.pause_opened.connect(_on_pause_opened)
	#Sorteeritavate asjade kogus
	Global.items_sorted = 0
	Global.total_items_collected = $"HotbarLayer/Hotbar".get_total_item_count()
	print("items_sorterd: ", Global.items_sorted, "Items collected: ", Global.total_items_collected)
	
	#Leveli vahetuse nupu määramine
	next_level_arrow.set_enabled(false)
	

func _process(delta):
	$"Score".text = str(Global.skoor)
	#update_score(Global.skoor) # Algse skoori seadistamine


#Pause funktsionaalsus
func _on_pause_button_pressed():
	pause_menu.set_paused(true)
	pause_button.hide()
	
func _on_pause_closed():
	pause_button.show()
	
func _on_pause_opened():
	pause_button.hide()
