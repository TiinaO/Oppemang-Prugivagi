class_name PauseMenu
extends Control

@onready var click_sfx:AudioStreamPlayer = $ClickButtonSfx

@onready var options_menu = $Options as OptsionsMenu
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button

@onready var instructions_page = $InstructionsPage as InstructionsPage
@onready var tutorials_button = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button as Button

@onready var continue_button = $MarginContainer/HBoxContainer/VBoxContainer/Continue_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button

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

func on_exit_pressed():
	margin_container.set_process(false)
	confirm_popup.set_process(true)
	confirm_popup.visible = true
	#get_tree().quit()

func on_continue_button_pressed() -> void:
	_is_paused = false

func on_options_pressed() -> void:
	margin_container.visible = false
	#click_sfx.play()
	options_menu.set_process(true)
	options_menu.visible = true

func on_tutorials_pressed() -> void:
	#click_sfx.play()
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

func on_exit_popup_pressed() -> void:
	confirm_popup.set_process(false)
	confirm_popup.visible = false
	margin_container.set_process(true)

func handle_connecting_signals() -> void:
	continue_button.button_down.connect(on_continue_button_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_button.button_down.connect(on_options_pressed)
	tutorials_button.button_down.connect(on_tutorials_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_pressed)
	instructions_page.exit_instructions_page.connect(on_exit_instructions_pressed)
	confirm_popup.exit_confirm_popup.connect(on_exit_popup_pressed)
