extends Node2D

class_name ContainerBin #Kuna nimeks ei saa Container panna


@export var container_data: ContainerType #Tegemist on konteineri resurssiga, kus on olemas konteineri tüüpandmed

@onready var container_texture = $Container as Sprite2D
@onready var detect_area = $DetectArea

var is_open := false


func _ready():
	#modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0) #See teeb tumetamaks visuaali
	
	add_to_group("containers")
	set_meta("is_container_bin", true)

	# Ühendame signaalid
	detect_area.area_entered.connect(_on_area_entered)
	detect_area.area_exited.connect(_on_area_exited)
	
	update_sprite_texture(container_data.texture_closed)


func update_sprite_texture(texture: Texture2D):
	if not texture:
		return

	container_texture.texture = texture

	# Arvuta tekstuuri kõrgus skaleerimisega
	var texture_height = texture.get_height() * container_texture.scale.y
	var bottom_y = 744  # Alumise serva kõrgus

	# Nihuta nii, et alumine äär jääb samale kohale
	container_texture.global_position.y = bottom_y - texture_height


func _on_area_entered(area: Area2D) -> void:
	var item_node  = area.get_parent()
	print("item node: " ,item_node)
	if item_node and item_node.is_in_group("draggables") and item_node.has_method("get_item_type"):
		
		var item_type = item_node.get_item_type()
		#Kui alasse minnakse, siis muudetakse pilte avatud olekusse
		update_sprite_texture(container_data.texture_open)


func _on_area_exited(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent and parent.is_in_group("draggables"):
		print("Ese lahkus konteineri alast!")
		update_sprite_texture(container_data.texture_closed)


func get_containter_data():
	if container_data != null:
		return container_data
	return ""
