class_name OptsionsMenu
extends Control

@onready var x_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/x_button
@onready var click_sfx:AudioStreamPlayer = $ClickButtonSfx as AudioStreamPlayer

@onready var music_on_off = $MarginContainer/VBoxContainer/HBoxContainer2/Music_on_off
@onready var sound_on_off = $MarginContainer/VBoxContainer/HBoxContainer3/Sound_on_off


@export var on_image: Texture2D = load("res://Assets/Menu/Options/Toggle.png")
@export var off_image: Texture2D = load("res://Assets/Menu/Options/Toggle-1.png")

@onready var sprite_2d_music = $MarginContainer/VBoxContainer/HBoxContainer2/Music_on_off/Sprite2D
@onready var sprite_2d_sound = $MarginContainer/VBoxContainer/HBoxContainer3/Sound_on_off/Sprite2D


signal exit_options_menu

func _ready():
	set_process(false) # So button cannot do anything immediately
	handle_connecting_signals()

func sound_on_button_down() -> void:
	click_sfx.play()
	set_process(false)

func on_back_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)

func on_music_on_off_pressed() -> void:
	if sprite_2d_music.texture == on_image:
		sprite_2d_music.texture = off_image
	else:
		sprite_2d_music.texture = on_image

func on_sound_on_off_pressed() -> void:
	if sprite_2d_sound.texture == on_image:
		sprite_2d_sound.texture = off_image
	else:
		sprite_2d_sound.texture = on_image

func handle_connecting_signals() -> void:
	x_button.button_down.connect(sound_on_button_down)
	x_button.button_up.connect(on_back_pressed)
	music_on_off.button_down.connect(on_music_on_off_pressed)
	sound_on_off.button_down.connect(on_sound_on_off_pressed)
