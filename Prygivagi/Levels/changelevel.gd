extends Area2D

func _physics_process(_delta):
	var objs = get_overlapping_bodies()
	for obj in objs:
		if obj.name=="PlayerRaccoon":
			get_tree().change_scene_to_file("res://Levels/game_level2.tscn")
