extends Node2D

@onready var spawn_area = $HotbarLayer/SpawnArea
var item_scene = preload("res://Scenes/Levels/Sorting/sortable_item.tscn")

func _ready():
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


