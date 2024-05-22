class_name OptsionsMenu
extends Control

@onready var back_button = $MarginContainer/VBoxContainer/HBoxContainer/x_button as Button
@onready var click_sfx:AudioStreamPlayer = $ClickButtonSfx as AudioStreamPlayer

signal exit_options_menu

func _ready():
	back_button.button_down.connect(sound_on_button_down)
	back_button.button_up.connect(on_back_pressed)
	set_process(false) # So button cannot do anything immediately

func sound_on_button_down() -> void:
	click_sfx.play()
	set_process(false)

func on_back_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)

