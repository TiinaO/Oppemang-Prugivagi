class_name InstructionsPage
extends Control

@onready var back_button = $MarginContainer/VBoxContainer/Back as Button
@onready var click_sfx:AudioStreamPlayer = $ClickButtonSfx as AudioStreamPlayer
@onready var x_button: Button = $TextureRect/Button

signal exit_instructions_page

func _ready():
	x_button.button_down.connect(on_back_pressed)
	set_process(false) # So button cannot do anything immediately

func on_back_pressed() -> void:
	exit_instructions_page.emit()
	click_sfx.play()
	set_process(false)
