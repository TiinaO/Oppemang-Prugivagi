extends Sprite2D

@export var enabled_texture: Texture2D = preload("res://Assets/Bin_/Bin_/Forward_112x112px.png")
@export var disabled_texture: Texture2D = preload("res://Assets/UI_/_Button_/State=Inaktiivne.png")
var is_enabled: bool = true

@onready var confirm_popup = get_tree().current_scene.get_node("Confirm/ConfirmActionPopup") as ConfirmActionPopup

func _ready():
	# Luba sisendi sündmused
	set_process_input(true)

func _input(event):
	if not is_enabled:
		return
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Kontrolli, kas klikk oli sprite alal
			if get_rect().has_point(to_local(event.position)):
				_on_sprite_clicked()

func _on_sprite_clicked():
	confirm_popup.show_confirm("KAS OLED KINDEL, ET SOOVID EDASI MINNA?", 
	func():
		get_tree().change_scene_to_file("res://Levels/game_level2.tscn"))


func set_enabled(value: bool):
	is_enabled = value
	update_visual()

func update_visual():
	texture = enabled_texture if is_enabled else disabled_texture
	set_process_input(is_enabled)
