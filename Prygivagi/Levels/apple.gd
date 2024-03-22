# apple.gd
extends CharacterBody2D
var player_in_area = false

func _on_area_2d_body_entered(body):
	if body.name == "PlayerRaccoon":
		player_in_area = true

func _on_area_2d_body_exited(body):
	if body.name == "PlayerRaccoon":
		player_in_area = false

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		queue_free()
		
		var player_node = get_node("../PlayerRaccoon")
		if player_node:
			player_node.play_action_animation()
