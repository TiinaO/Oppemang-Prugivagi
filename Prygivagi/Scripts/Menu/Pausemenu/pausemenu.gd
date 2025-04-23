class_name PauseMenu
extends Control

@onready var continue_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Continue_Button/Continue2

@onready var options_menu = $Options as OptsionsMenu
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var options_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button/Sprite2D

@onready var instructions_page = $InstructionsPage as InstructionsPage
@onready var tutorials_button = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button as Button
@onready var tutorials_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button/Sprite2D2

#@onready var sorting_instructions_page = $SortingInstructionsBeginning as SortingBeginning
@onready var sorting_instructions_page = $SortingInstructions as SortingInstructions
@onready var sorting_instructions_button = $MarginContainer/HBoxContainer/VBoxContainer/Sorting_Instructions_Button as Button
@onready var sorting_instructions_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Sorting_Instructions_Button/Sprite2D2

@onready var back_to_main_menu_button = $MarginContainer/HBoxContainer/VBoxContainer/Back_To_Main_Menu_Button as Button
@onready var back_to_main_menu_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Back_To_Main_Menu_Button/Back_To_Main_Menu
@onready var continue_button = $MarginContainer/HBoxContainer/VBoxContainer/Continue_Button as Button

@onready var clicking_sound: AudioStreamPlayer = $ClickingSound

@onready var margin_container = $MarginContainer as MarginContainer
@onready var confirm_popup = $ConfirmActionPopup as ConfirmActionPopup

signal pause_opened
signal pause_closed

var _is_paused:bool = false:
	set = set_paused

func _ready():
	get_tree().paused = false #Default value
	handle_connecting_signals()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		_is_paused = !_is_paused
		

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused
	
	#if !_is_paused:
		#emit_signal("pause_closed")
	if _is_paused:
		pause_opened.emit()
	else:
		pause_closed.emit()


func on_continue_button_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.3).timeout
	_is_paused = false
	pause_closed.emit()

func on_back_to_main_menu_pressed() -> void:
	clicking_sound.play()
	confirm_popup.show_confirm("Nõustumisel tuleb alustada uut mängu. KAS OLED KINDEL, ET SOOVID MINNA PEAMENÜÜSSE?", 
	func():
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Mainmenu/main_menu.tscn"), 
		func(): pass,
		true)

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

func on_sorting_instructions_button_pressed() -> void:
	clicking_sound.play()
	await get_tree().create_timer(0.3).timeout
	sorting_instructions_page.current_index = 0 
	sorting_instructions_page.update_visual() 
	margin_container.visible = false
	sorting_instructions_page.set_process(true)
	sorting_instructions_page.visible = true
	

func on_exit_options_pressed() -> void:
	margin_container.visible = true
	options_menu.set_process(false)
	options_menu.visible = false

func on_exit_instructions_pressed() -> void:
	margin_container.visible = true
	instructions_page.set_process(false)
	instructions_page.visible = false

func on_exit_sorting_instructions_pressed() -> void:
	margin_container.visible = true
	sorting_instructions_page.set_process(false)
	sorting_instructions_page.visible = false


func handle_connecting_signals() -> void:
	continue_button.button_down.connect(on_continue_button_pressed)
	options_button.button_down.connect(on_options_pressed)
	tutorials_button.button_down.connect(on_tutorials_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_pressed)
	instructions_page.exit_instructions_page.connect(on_exit_instructions_pressed)
	back_to_main_menu_button.button_down.connect(on_back_to_main_menu_pressed)
	sorting_instructions_button.button_down.connect(on_sorting_instructions_button_pressed)
	sorting_instructions_page.exit_sorting_instructions.connect(on_exit_sorting_instructions_pressed)



# Nuppude tekstuuri muutmine hiirega nupu peal hõljumisel
func _on_continue_button_mouse_entered():
	continue_image.texture = load("res://Assets/Menu/Menu buttons=Jatka2.png")


func _on_continue_button_mouse_exited():
	continue_image.texture = load("res://Assets/Menu/Menu buttons=Jatka1.png")


func _on_options_button_mouse_entered():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded2.png")


func _on_options_button_mouse_exited():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded1.png")


func _on_tutorials_button_mouse_entered():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Mangujuhend2.png")


func _on_tutorials_button_mouse_exited():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Mangujuhend1.png")


func _on_back_to_main_menu_button_mouse_entered():
	back_to_main_menu_image.texture = load("res://Assets/Menu/Menu buttons=Peamenuu2.png")


func _on_back_to_main_menu_button_mouse_exited():
	back_to_main_menu_image.texture = load("res://Assets/Menu/Menu buttons=Peamenuu1.png")


func _on_sorting_instructions_button_mouse_entered():
	sorting_instructions_image.texture = load("res://Assets/Menu/Pause/Menu buttons=Sorteerimine2.png")


func _on_sorting_instructions_button_mouse_exited():
	sorting_instructions_image.texture = load("res://Assets/Menu/Pause/Menu buttons=Sorteerimine1.png")
