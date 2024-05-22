class_name SortingBeginning
extends Control

@onready var next_button: Button = $Go_Next_Button
@onready var click_sfx: AudioStreamPlayer = $ClickButtonSfx

# Called when the node enters the scene tree for the first time.
func _ready():
	next_button.button_down.connect(on_next_pressed)
	set_process(false)

func on_next_pressed() -> void:
	click_sfx.play()
	set_process(false)
