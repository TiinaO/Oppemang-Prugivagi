class_name ConfirmActionPopup
extends Node

@onready var x_button = $MarginContainer/HBoxContainer/VBoxContainer2/x_button as Button
@onready var yes_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/yes_button as Button
@onready var no_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/HBoxContainer2/no_button as Button


func _ready():
	handle_connecting_signals()

func on_x_pressed() -> void:
	pass

func on_yes_pressed() -> void:
	get_tree().quit()

func on_no_pressed() -> void:
	pass


func handle_connecting_signals() -> void:
	x_button.button_down.connect(on_x_pressed)
	yes_button.button_down.connect(on_yes_pressed)
	no_button.button_down.connect(on_no_pressed)
	
