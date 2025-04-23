class_name SortingInstructions
extends Control

#@onready var next_button = $MarginContainer/Next_Button2 as Button
#@onready var back_button = $MarginContainer/Back_Button2 as Button
@onready var next_button = $Next_Button as Button
@onready var back_button = $Back_Button as Button
@onready var exit_button = $Exit_Button as Button
@onready var texture_rect = $TextureRect
@onready var click_sfx: AudioStreamPlayer = $ClickButtonSfx

signal exit_sorting_instructions

var current_index := 0
var default_exit_position := Vector2()
var default_next_position := Vector2()

var instruction_textures: Array[Texture2D] = [
	preload("res://Assets/Menu/Sorting/Puhas/Algus.png"),
	preload("res://Assets/Menu/Sorting/Puhas/Biojaatmed.png"),
	preload("res://Assets/Menu/Sorting/Puhas/Segapakend.png"),
	preload("res://Assets/Menu/Sorting/Puhas/PappJaPaber.png"),
	preload("res://Assets/Menu/Sorting/Puhas/Klaaspakend.png"),
	preload("res://Assets/Menu/Sorting/Puhas/Olme.png"),
	preload("res://Assets/Menu/Sorting/Puhas/Vanapaber.png")
]

func _ready():
	call_deferred("setup_after_layout")
	back_button.pressed.connect(on_back_pressed)
	next_button.pressed.connect(on_next_pressed)


func setup_after_layout():
	default_exit_position = exit_button.position
	default_next_position = next_button.position
	update_visual()

func on_back_pressed():
	if current_index > 0:
		current_index -= 1
		update_visual()

func on_next_pressed():
	if current_index < instruction_textures.size() - 1:
		current_index += 1
		update_visual()

func on_exit_pressed():
	print("Exit nuppu vajutati")
	exit_sorting_instructions.emit()
	set_process(false)
	#hide()

func update_visual():
	if current_index >= 0 and current_index < instruction_textures.size():
		texture_rect.texture = instruction_textures[current_index]
		
	#Esimesel lehel ei kuvata vasakule mineku nuppu
	back_button.visible =current_index != 0
	
	if current_index == 0:
		exit_button.position = Vector2(1742, 110)  
		next_button.position = Vector2(1652, 812)
	else:
		exit_button.position = default_exit_position
		next_button.position = default_next_position

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if exit_button.get_global_rect().has_point(get_global_mouse_position()):
			print("Hiireklõps Exit_Button alal")
			on_exit_pressed()
