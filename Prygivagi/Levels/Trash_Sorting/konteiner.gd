extends StaticBody2D

func _ready():
	modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0)

func _on_texture_rect_mouse_entered():
	$TextureRect.texture = load("res://Assets/Konteinerid/Olme=Open.png")

func _on_texture_rect_mouse_exited():
	$TextureRect.texture = load("res://Assets/Konteinerid/Konteiner OLMEJÄÄTMED.png")

func _on_klaas_mouse_entered():
	$"../StaticBody2D2/TextureRect".texture = load("res://Assets/Konteinerid/Klaas=Open.png")

func _on_klaas_mouse_exited():
	$"../StaticBody2D2/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner KLAAS.png")

func _on_pappjapaber_mouse_entered():
	$"../StaticBody2D3/TextureRect".texture = load("res://Assets/Konteinerid/Papp-paber=Open.png")

func _on_pappjapaber_mouse_exited():
	$"../StaticBody2D3/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner PAPP JA PABER.png")

func _on_sega_mouse_entered():
	$"../StaticBody2D4/TextureRect".texture = load("res://Assets/Konteinerid/Sega=Open.png")

func _on_sega_mouse_exited():
	$"../StaticBody2D4/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner METALL JA PLASTIK.png")

func _on_bio_mouse_entered():
	$"../StaticBody2D5/TextureRect".texture = load("res://Assets/Konteinerid/Bio=Open.png")

func _on_bio_mouse_exited():
	$"../StaticBody2D5/TextureRect".texture = load("res://Assets/Konteinerid/Konteiner BIOJÄÄTMED.png")
