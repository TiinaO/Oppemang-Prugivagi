class_name SortingMixed
extends Control

@onready var back_button: Button = $MarginContainer/Back_Button2
@onready var next_button: Button = $MarginContainer/Next_Button2
@onready var exit_button: Button = $Exit_Button
@onready var click_button_sfx: AudioStreamPlayer = $ClickButtonSfx
@onready var margin_container = $MarginContainer
@onready var sorting_paper = $SortingPaper as SortingPaper

signal back_to_bio_page

func _ready():
	handle_connecting_signals()
	set_process(false)

func on_next_pressed() -> void:
	margin_container.visible = false
	sorting_paper.visible = true
	click_button_sfx.play()
	set_process(false)

func on_back_pressed() -> void:
	click_button_sfx.play()
	back_to_bio_page.emit()
	set_process(false)

func reload_pause_menu():
	get_tree().change_scene_to_file("res://Scenes/Menu/PauseMenu/pausemenu.tscn")

func on_exit_pressed() -> void:
	click_button_sfx.play()
	reload_pause_menu()

func on_back_from_paper_page() -> void:
	margin_container.visible = true
	sorting_paper.set_process(false)
	sorting_paper.visible = false

func handle_connecting_signals() -> void:
	back_button.button_down.connect(on_back_pressed)
	next_button.button_down.connect(on_next_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	sorting_paper.back_to_sorting_mixed.connect(on_back_from_paper_page)

