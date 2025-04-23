class_name SortingBeginning
extends Control

@onready var next_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/Go_Next_Button
@onready var click_sfx: AudioStreamPlayer = $MarginContainer/ClickButtonSfx
@onready var sorting_bio = $SortingBio as SortingBio
@onready var margin_container = $MarginContainer


func _ready():
	handle_connecting_signals()
	set_process(false)

func on_next_pressed() -> void:
	margin_container.visible = false
	sorting_bio.visible = true
	click_sfx.play()
	set_process(false)

func on_back_from_sorting_bio() -> void:
	click_sfx.play()
	margin_container.visible = true
	sorting_bio.set_process(false)
	sorting_bio.visible = false

func handle_connecting_signals() -> void:
	next_button.button_down.connect(on_next_pressed)
	sorting_bio.back_to_sorting_beginning.connect(on_back_from_sorting_bio)

