extends Area2D

@export var container_data: ContainerType #Tegemist on konteineri resurssiga, kus on olemas konteineri tüüpandmed

@onready var container_texture = $Container as Sprite2D

const desired_bottom_y: float = 325.0 

func _ready():
	#modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0) #See teeb tumetamaks visuaali
	connect("area_entered",Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))
	if container_data:
		print("Saab aru container datast")
		update_texture(container_data.texture_closed)
	
#func _on_area_entered(area):
	#if area is SortableItem:
		#container_texture = container_data.texture_open
		#
		#if area.item_data.type == container_data.type:
			#print("Õige konteiner:", container_data.display_name)
			#area.correctly_sorted()
		#else:
			#print("Vale konteiner:", container_data.display_name)
			#area.return_to_hotbar()
#
#func _on_area_exited(area):
	#if area is SortableItem:
		#container_texture = container_data.texture_closed

func set_container_open(is_open: bool):
	if container_data == null:
		return

	var new_texture = container_data.texture_open if is_open else container_data.texture_closed
	update_texture(new_texture)

func update_texture(texture: Texture2D):
	container_texture.texture = texture

	if texture:
		var tex_height = texture.get_height() * container_texture.scale.y
		container_texture.position.y = desired_bottom_y - tex_height

func update_sprite_texture(texture: Texture2D):
	if not texture:
		return

	container_texture.texture = texture

	# Arvuta tekstuuri kõrgus skaleerimisega
	var texture_height = texture.get_height() * container_texture.scale.y
	var bottom_y = 749  # ← see on see kõrgus, millele sa tahad kinnitada alumise serva

	# Nihuta nii, et alumine äär jääb samale kohale
	container_texture.global_position.y = bottom_y - texture_height

func _on_mouse_exited():
	update_sprite_texture(container_data.texture_closed)
	#container_texture.texture = container_data.texture_closed


func _on_mouse_entered():
	update_sprite_texture(container_data.texture_open)
	#container_texture.texture = container_data.texture_open
