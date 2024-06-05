extends Node2D

func _process(delta):
	$"Score".text = str(Global.skoor)
	#update_score(Global.skoor) # Algse skoori seadistamine
#
#func update_score(new_score):
	#var score_label = $"Score"
	#score_label.text = str(new_score)

