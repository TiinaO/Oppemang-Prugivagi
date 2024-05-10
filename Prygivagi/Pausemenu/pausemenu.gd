class_name PauseMenu
extends Control

@onready var continue_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Continue_Button/Continue2

@onready var options_menu = $Options as OptsionsMenu
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var options_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button/Sprite2D

@onready var instructions_page = $InstructionsPage as InstructionsPage
@onready var tutorials_button = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button as Button
@onready var tutorials_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button/Sprite2D2

@onready var back_to_main_menu_button = $MarginContainer/HBoxContainer/VBoxContainer/Back_To_Main_Menu_Button as Button
@onready var back_to_main_menu_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Back_To_Main_Menu_Button/Back_To_Main_Menu
@onready var continue_button = $MarginContainer/HBoxContainer/VBoxContainer/Continue_Button as Button

@onready var clicking_sound: AudioStreamPlayer = $ClickingSound

@onready var margin_container = $MarginContainer as MarginContainer
@onready var confirm_popup = $ConfirmActionPopup as ConfirmActionPopup

var _is_paused:bool = false:
	set = set_paused

func _ready():
	handle_connecting_signals()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		_is_paused = !_is_paused

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func on_continue_button_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.3).timeout
	_is_paused = false

func on_back_to_main_menu_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.3).timeout
	_is_paused = false
	get_tree().change_scene_to_file("res://Mainmenu/main_menu.tscn")

func on_options_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.4).timeout
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_tutorials_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.3).timeout
	margin_container.visible = false
	instructions_page.set_process(true)
	instructions_page.visible = true

func on_exit_options_pressed() -> void:
	margin_container.visible = true
	options_menu.set_process(false)
	options_menu.visible = false

func on_exit_instructions_pressed() -> void:
	margin_container.visible = true
	instructions_page.set_process(false)
	instructions_page.visible = false

func handle_connecting_signals() -> void:
	continue_button.button_down.connect(on_continue_button_pressed)
	options_button.button_down.connect(on_options_pressed)
	tutorials_button.button_down.connect(on_tutorials_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_pressed)
	instructions_page.exit_instructions_page.connect(on_exit_instructions_pressed)
	back_to_main_menu_button.button_down.connect(on_back_to_main_menu_pressed)


func _on_continue_button_mouse_entered():
	continue_image.texture = load("res://Assets/Menu/Menu buttons=Jatka2.png")


func _on_continue_button_mouse_exited():
	continue_image.texture = load("res://Assets/Menu/Menu buttons=Jatka1.png")


func _on_options_button_mouse_entered():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded2.png")


func _on_options_button_mouse_exited():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded1.png")


func _on_tutorials_button_mouse_entered():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Juhised2.png")


func _on_tutorials_button_mouse_exited():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Juhised1.png")


func _on_back_to_main_menu_button_mouse_entered():
	back_to_main_menu_image.texture = load("res://Assets/Menu/Menu buttons=Peamenuu2.png")


func _on_back_to_main_menu_button_mouse_exited():
	back_to_main_menu_image.texture = load("res://Assets/Menu/Menu buttons=Peamenuu1.png")
