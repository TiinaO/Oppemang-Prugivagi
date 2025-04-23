class_name MainMenu
extends Control

@onready var click_sfx:AudioStreamPlayer = $ClickButtonSfx
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var options_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button/Sprite2D
@onready var options_menu = $Options as OptsionsMenu

@onready var tutorials_button = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button as Button
@onready var tutorials_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Tutorials_Button/Sprite2D2
@onready var instructions_page = $InstructionsPage as InstructionsPage

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/New_game_Button as Button
@onready var start_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/New_game_Button/New_game

@onready var sorting_instructions_image = $MarginContainer/HBoxContainer/VBoxContainer/Sorting_instructions/Sprite2D2
@onready var sorting_instructions_button = $MarginContainer/HBoxContainer/VBoxContainer/Sorting_instructions as Button
@onready var sorting_instructions_page = $SortingInstructions as SortingInstructions

@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var exit_image: Sprite2D = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button/Sprite2D3
@onready var margin_container = $MarginContainer as MarginContainer

@onready var confirm_popup = $ConfirmActionPopup as ConfirmActionPopup

var new_game = preload("res://Levels/game_level.tscn")

func _ready():
	handle_connecting_signals()
	new_game

func on_new_game_pressed() -> void:
	click_sfx.play()
	Global.skoor = 0

	if Global.player_inventory: 
		for slot in Global.player_inventory.slots:
			slot.item = null
			slot.amount = 0
		Global.player_inventory.update.emit()  

	Global.items_sorted = 0
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")

func on_options_pressed() -> void:
	margin_container.visible = false
	click_sfx.play()
	options_menu.set_process(true)
	options_menu.visible = true

func on_tutorials_pressed() -> void:
	click_sfx.play()
	margin_container.visible = false
	instructions_page.set_process(true)
	instructions_page.visible = true

func on_sorting_instructions_button_pressed() -> void:
	click_sfx.play()
	await get_tree().create_timer(0.3).timeout
	sorting_instructions_page.current_index = 0 
	sorting_instructions_page.update_visual() 
	margin_container.visible = false
	sorting_instructions_page.set_process(true)
	sorting_instructions_page.visible = true

func on_exit_pressed() -> void:
	margin_container.set_process(false)
	confirm_popup.show_confirm("KAS OLED KINDEL, ET SOOVID MÄNGU SULGEDA?", 
	func():
		get_tree().quit(), 
	func(): pass,
	true)

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

func on_exit_sorting_instructions_pressed() -> void:
	margin_container.visible = true
	sorting_instructions_page.set_process(false)
	sorting_instructions_page.visible = false

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_new_game_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_button.button_down.connect(on_options_pressed)
	tutorials_button.button_down.connect(on_tutorials_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_pressed)
	instructions_page.exit_instructions_page.connect(on_exit_instructions_pressed)
	sorting_instructions_button.button_down.connect(on_sorting_instructions_button_pressed)
	sorting_instructions_page.exit_sorting_instructions.connect(on_exit_sorting_instructions_pressed)


func _on_new_game_button_mouse_entered():
	start_image.texture = load("res://Assets/Menu/Menu buttons=Uus_mang2.png")

func _on_new_game_button_mouse_exited():
	start_image.texture = load("res://Assets/Menu/Menu buttons=Uus_mang1.png")

func _on_options_button_mouse_entered():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded2.png")

func _on_options_button_mouse_exited():
	options_image.texture = load("res://Assets/Menu/Menu buttons=Seaded1.png")

func _on_tutorials_button_mouse_entered():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Mangujuhend2.png")

func _on_tutorials_button_mouse_exited():
	tutorials_image.texture = load("res://Assets/Menu/Menu buttons=Mangujuhend1.png")

func _on_exit_button_mouse_entered():
	exit_image.texture = load("res://Assets/Menu/Menu buttons=Valju2.png")

func _on_exit_button_mouse_exited():
	exit_image.texture = load("res://Assets/Menu/Menu buttons=Valju1.png")

func _on_sorting_instructions_mouse_entered():
	sorting_instructions_image.texture = load("res://Assets/Menu/Pause/Menu buttons=Sorteerimine2.png")

func _on_sorting_instructions_mouse_exited():
	sorting_instructions_image.texture = load("res://Assets/Menu/Pause/Menu buttons=Sorteerimine1.png")
