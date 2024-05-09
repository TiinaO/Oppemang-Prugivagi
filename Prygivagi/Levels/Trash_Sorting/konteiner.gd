extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_texture_rect_mouse_entered():
	$TextureRect.texture = load("res://Assets/Konteinerid/Olme=Open.png")
	$"../StaticBody2D2/TextureRect".texture = load("res://Assets/Konteinerid/Klaas=Open.png")
	$"../StaticBody2D3/TextureRect".texture = load("res://Assets/Konteinerid/Papp-paber=Open.png")
	$"../StaticBody2D4/TextureRect".texture = load("res://Assets/Konteinerid/Sega=Open.png")
	$"../StaticBody2D5/TextureRect".texture = load("res://Assets/Konteinerid/Bio=Open.png")


func _on_texture_rect_mouse_exited():
	$TextureRect.texture = load("res://Assets/Konteinerid/Konteiner OLMEJÄÄTMED.png")
	$"../StaticBody2D2/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner KLAAS.png")
	$"../StaticBody2D3/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner PAPP JA PABER.png")
	$"../StaticBody2D4/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner METALL JA PLASTIK.png")
	$"../StaticBody2D5/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner BIOJÄÄTMED.png")
