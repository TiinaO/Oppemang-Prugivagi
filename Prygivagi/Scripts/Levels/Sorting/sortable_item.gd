extends Node2D

class_name  SortableItem

@export var item_data: InventoryItem
var origin_slot_node: Panel  
var is_dragging := true

@export var original_position := Vector2.ZERO
@export var item_type: String = ""
@export var item_name: String = ""

@onready var sprite = $Area2D/Sprite2D as Sprite2D
@onready var collision = $CollisionShape2D as CollisionShape2D
@onready var area_2d = $Area2D as Area2D

var slot: InvSlot

# Called when the node enters the scene tree for the first time
func _ready():
	if item_data:
		print("SortableItem sai item_data:", item_data.type, "| tüüp:", item_data.type)
		item_type = item_data.type
		item_name = item_data.name
		if item_data.texture:
			sprite.texture = item_data.texture
		else:
			print("[SortableItem] Puudub tekstuur item_data jaoks: ", item_name)
		print("Spawnin:", item_data.name, " with texture:", item_data.texture)
	 
	# Drag loogika algus
	set_process(true)
	set_process_unhandled_input(true)
	
	#Konteineri jaoks
	add_to_group("draggables")
	area_2d.monitoring = true
	area_2d.monitorable = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position()
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		on_drop()


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		on_drop()


func on_drop():
	is_dragging = false
	
	var overlapping_areas = area_2d.get_overlapping_areas()
	print("Leitud alad:", overlapping_areas)
	
	for area in overlapping_areas:
		var container = area.get_parent() 

		if container and container.has_meta("is_container_bin"):
			
			var container_type = container.container_data.type
			var item_type = item_data.type
			
			print("Konteineri tüüp on: ", container_type, " ja item type on: ", item_type)
			
			if item_type == container_type:
				print("Õige konteiner – +100p")
				Global.skoor += 100

				if origin_slot_node and origin_slot_node.has_method("remove_one_item"):
					origin_slot_node.remove_one_item()

				queue_free()
			else:
				print("Vale konteiner – -25p")
				Global.skoor -= 25
				return_to_hotbar()
			
			return  # katkestame peale esimest konteinerit

	# Kui ei olnud sobivat konteinerit
	return_to_hotbar()


func return_to_hotbar():
	var tween := get_tree().create_tween()
	tween.tween_property(self, "global_position", original_position, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.finished.connect(func():return_to_slot())



func return_to_slot():
	if origin_slot_node and origin_slot_node.has_method("restore_item"):
		origin_slot_node.restore_item()
	queue_free()


func correctly_sorterd():
	#Siia lisada veel loogikat, mis peab juhtuma siis, kui korrektselt sorteeritud, NT punktid
	queue_free()
	
#Konteineri jaoks, et saada kätte eseme tüüp
func get_item_type() -> String:
	if item_data:
		return item_data.type
	return ""
