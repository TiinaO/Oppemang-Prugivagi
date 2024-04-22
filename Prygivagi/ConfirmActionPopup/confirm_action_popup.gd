class_name ConfirmActionPopup
extends Node

@onready var x_button = $MarginContainer/VBoxContainer2/VBoxContainer3/x_button as Button
@onready var yes_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/yes_button as Button
@onready var no_button = $MarginContainer/VBoxContainer2/HBoxContainer3/HBoxContainer/HBoxContainer2/no_button as Button

signal exit_confirm_popup
signal exit_confirm_popup_with_x


func _ready():
	handle_connecting_signals()
	set_process(false)

func on_x_pressed() -> void:
	print("MA EI TÖÖÖTA SEST ..... MIKS?")
	exit_confirm_popup.emit()
	set_process(false)

func on_yes_pressed() -> void:
	get_tree().quit()

func on_no_pressed() -> void:
	exit_confirm_popup.emit()
	set_process(false)

func handle_connecting_signals() -> void:
	x_button.button_down.connect(on_x_pressed)
	yes_button.button_down.connect(on_yes_pressed)
	no_button.button_down.connect(on_no_pressed)
	
