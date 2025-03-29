extends Control
class_name ConfirmActionPopup

@onready var label = $MarginContainer/VBoxContainer2/Label2 as Label
@onready var x_button = $MarginContainer/VBoxContainer2/VBoxContainer3/x_button as Button
@onready var yes_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/yes_button as Button
@onready var no_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/no_button as Button
@onready var yes_button_sprite = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/yes_button/Sprite2D as Sprite2D
@onready var no_button_sprite = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/no_button/Sprite2D as Sprite2D

var on_confirm: Callable = func(): pass
var on_cancel: Callable = func(): pass

# Nuppude tekstuuride preload - et saaks dünaamiliselt kasutada.
var exit_no_button_texture: Texture2D = preload("res://Assets/Menu/UI buttons=Ei_roheline.png") # Tahame, et ta mängu jääks
var exit_yes_button_texture: Texture2D = preload("res://Assets/Menu/UI buttons=Jah_punane.png") # Tegevus, mida soovime, et ei teeks
var default_no_button_texture: Texture2D = preload("res://Assets/Menu/UI buttons=Ei_punane.png")
var default_yes_button_texture: Texture2D = preload("res://Assets/Menu/UI buttons=Jah_roheline.png")

func _ready():
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	x_button.pressed.connect(_on_cancel_pressed)
	no_button.pressed.connect(_on_cancel_pressed)
	yes_button.pressed.connect(_on_yes_pressed)
	hide()

func show_confirm(message: String, confirm_callback: Callable, cancel_callback: Callable = func(): pass, is_exit_popup: bool = false):
	label.text = message
	on_confirm = confirm_callback
	on_cancel = cancel_callback
	
	#Button tekstuuri vahetamine
	if is_exit_popup:
		yes_button_sprite.texture = exit_yes_button_texture
		no_button_sprite.texture = exit_no_button_texture
	else:
		yes_button_sprite.texture = default_yes_button_texture
		no_button_sprite.texture = default_no_button_texture
	
	show()

func _on_yes_pressed():
	hide()
	on_confirm.call()

func _on_cancel_pressed():
	hide()
	on_cancel.call()
