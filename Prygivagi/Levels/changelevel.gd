extends Area2D

@onready var popup = $"../CanvasLayer/ConfirmActionPopup"

var popup_has_triggered := false #Vajalik, et määrata, kas popup on ees
var can_move = true #Saab kõndida kuni popup ette tuleb, siis jääb seisma
var player 

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	
	
	if popup_has_triggered:
		return

	if body.name == "PlayerRaccoon":
		popup_has_triggered = true
		show_confirm_popup()
		player = body
		player.can_move = false

func show_confirm_popup():
	popup.show_confirm("KAS OLED KINDEL, ET SOOVID 
MINNA EDASI PRÜGI SORTEERIMA?", 
	func(): 
		get_tree().change_scene_to_file("res://Scenes/Levels/Sorting/sorting_level.tscn"), 
	func(): 
		player.can_move = true
		popup_has_triggered = false)
