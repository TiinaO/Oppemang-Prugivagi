extends Node2D

@export var container_data: ContainerType #Tegemist on konteineri resurssiga, kus on olemas konteineri tüüpandmed

@onready var container_texture = $Container as Sprite2D
@onready var detect_area = $DetectArea

var is_open := false


func _ready():
	#modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0) #See teeb tumetamaks visuaali

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
	var bottom_y = 744  # ← see on see kõrgus, millele sa tahad kinnitada alumise serva

	# Nihuta nii, et alumine äär jääb samale kohale
	container_texture.global_position.y = bottom_y - texture_height

func _on_mouse_exited():
	update_sprite_texture(container_data.texture_closed)


func _on_mouse_entered():
	update_sprite_texture(container_data.texture_open)

func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent and parent.is_in_group("draggables"):
		print("Ese sisenes konteineri alasse IN IF!")
		update_sprite_texture(container_data.texture_open)

func _on_area_exited(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent and parent.is_in_group("draggables"):
		print("Ese lahkus konteineri alast!")
		update_sprite_texture(container_data.texture_closed)
