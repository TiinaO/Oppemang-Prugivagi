extends Node2D

@onready var spawn_area = $HotbarLayer/SpawnArea
var item_scene = preload("res://Scenes/Levels/Sorting/sortable_item.tscn")

@onready var pause_button = $"UI elements/MarginContainer/HBoxContainer/PauseButton"
@onready var pause_menu = $PauseMenu/Pause_menu

func _ready():
	pause_button.pressed.connect(_on_pause_button_pressed)
	pause_menu.pause_closed.connect(_on_pause_closed)
	pause_menu.pause_opened.connect(_on_pause_opened)
	print("Picked items:", Global.picked_items.size())
	
	for entry in Global.picked_items:
		
		var item = entry["item"]
		var pos = entry["position"]
		
		var obj = item_scene.instantiate()
		obj.item_data = item
		obj.global_position = Vector2(700, 100)

func _process(delta):
	$"Score".text = str(Global.skoor)
	#update_score(Global.skoor) # Algse skoori seadistamine

func _on_pause_button_pressed():
	pause_menu.set_paused(true)
	pause_button.hide()
	
func _on_pause_closed():
	pause_button.show()
	
func _on_pause_opened():
	pause_button.hide()
