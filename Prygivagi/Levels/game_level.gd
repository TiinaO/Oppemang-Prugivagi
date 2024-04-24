extends Node2D

var score = 0 # Skoori hoidja

func _ready():
	update_score(0) # Algse skoori seadistamine

func add_score(points):
	score += points
	update_score(score)

func update_score(new_score):
	var score_label = $UserInterface/GameUI/Score
	score_label.text = str(new_score)
