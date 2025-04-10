extends Node2D

class_name  SortableItem

@export var item_data: InventoryItem
@export var item_type: String = ""
@export var item_name: String = ""

@onready var sprite = $Sprite2D as Sprite2D
@onready var collision = $CollisionShape2D as CollisionShape2D

var slot: InvSlot

# Called when the node enters the scene tree for the first time
func _ready():
	if item_data:
		
		item_type = item_data.type
		item_name = item_data.name
		if item_data.texture:
			sprite.texture = item_data.texture
		else:
			print("[SortableItem] Puudub tekstuur item_data jaoks: ", item_name)
		print("Spawnin:", item_data.name, " with texture:", item_data.texture)

func set_position_under_mouse():
	global_position = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
