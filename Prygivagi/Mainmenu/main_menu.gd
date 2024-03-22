extends Control

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_tutorials_button_pressed():
	get_tree().change_scene_to_file("res://Instructions/instructions_page.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")
