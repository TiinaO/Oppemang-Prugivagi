extends Control

var _is_paused:bool = false:
	set = set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		_is_paused = !_is_paused

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused



func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_tutorials_button_pressed():
	get_tree().change_scene_to_file("res://Instructions/instructions_page.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")


func _on_continue_button_pressed() -> void:
	_is_paused = false
