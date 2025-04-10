extends Node2D

@onready var spawn_area = $SpawnArea
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

func spawn_sortable_item(item: InventoryItem):
	var obj = preload("res://Levels/Prügi/trash_object.tscn").instantiate()
	obj.texture = item.texture
	obj.item_type = item.type
	obj.item_name = item.name
	obj.global_position = get_random_spawn_position()
	add_child(obj)

func get_random_spawn_position() -> Vector2:
	var area_size = Vector2(800, 600)  # kohanda enda mänguruumi järgi
	return Vector2(
		randi_range(100, area_size.x - 100),
		randi_range(100, area_size.y - 100)
		)
