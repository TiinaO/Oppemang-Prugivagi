"""extends Control

@export var item_data: InventoryItem
@onready var texture_rect = $TextureRect

var is_dragging = true
var original_position := Vector2.ZERO
var origin_slot_node: Control = null  # viide hotbari slotile, kust tuli

func _ready():
	print("SortableItemUI READY")
	
	if not item_data:
		print("❌ item_data is null! Ootame hilisemat määramist...")
		await ready  # oota kaadri lõpuni (või ära tee midagi)
		return
		
	set_process(true)
	set_process_unhandled_input(true)
	original_position = global_position
	texture_rect.texture = item_data.texture
	
	mouse_filter = Control.MOUSE_FILTER_STOP

func _process(_delta):
	if is_dragging:
		var mouse_pos = get_viewport().get_mouse_position()
		if texture_rect.texture:
			var size = texture_rect.texture.get_size()
			global_position = mouse_pos - size / 2

func _unhandled_input(event):
	if event is InputEventMouseButton:
		print("🖱 Mouse event:", event.button_index, "Pressed:", event.pressed)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		print("🔽 Lahti lastud – käivitan on_drop")
		on_drop()

func on_drop():
	is_dragging = false
	print("🟡 on_drop() kutsuti")
	return_to_hotbar()
	
func return_to_hotbar():
	print("🔁 return_to_hotbar() algas")
	print("🎯 Orig pos:", original_position)
	print("📍 Praegune pos:", global_position)

	var tween := get_tree().create_tween()
	tween.tween_property(self, "global_position", original_position, 0.3) \
		.set_trans(Tween.TRANS_QUAD) \
		.set_ease(Tween.EASE_OUT)

	tween.finished.connect(func():
		print("✅ Tween lõppes – tagastame slotile")
		return_to_slot()
	)

func return_to_slot():
	if origin_slot_node and origin_slot_node.has_method("restore_item"):
		origin_slot_node.restore_item()
	queue_free()
	
func spawn_sortable_item():
	var item_scene = preload("res://Scenes/Levels/Sorting/sortable_item.tscn")
	var item_instance = item_scene.instantiate()
	item_instance.item_data = item_data
	item_instance.item_type = item_data.type
	item_instance.item_name = item_data.name
	item_instance.global_position = get_global_mouse_position()

	var spawn_area = get_tree().current_scene.get_node("SpawnArea")
	if spawn_area:
		spawn_area.add_child(item_instance)
		queue_free()  # eemaldame UI-itemi
	else:
		print("❌ SpawnArea not found!")
		
		
func setup(item: InventoryItem, slot: Control):
	item_data = item
	origin_slot_node = slot

	if not texture_rect:
		print("❌ texture_rect is NULL – kas $TextureRect node eksisteerib?")
		return

	if item_data and item_data.texture:
		print("OMG SAI IKKA")
		texture_rect.texture = item_data.texture
		original_position = global_position
	else:
		print("⚠️ setup: item_data või texture puudub!")"""
