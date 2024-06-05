extends Control

# Defineerime muutujad piltide jaoks
@export var default_textures: Array[Texture2D] = []
@export var hover_textures: Array[Texture2D] = []

# Muutujad Sprite2D node-de jaoks
var sprites: Array[Sprite2D] = []

func _ready():
	# Saame viited kõikidele Sprite2D node-dele ja seadistame algsed pildid
	for i in range(default_textures.size()):
		var sprite = get_child(i) as Sprite2D
		sprite.texture = default_textures[i]
		sprite.mouse_filter = 1 # 1 tähendab Control.MOUSE_FILTER_PASS
		sprite.connect("mouse_entered", Callable(self, "_on_mouse_entered").bind(i))
		sprite.connect("mouse_exited", Callable(self, "_on_mouse_exited").bind(i))
		sprites.append(sprite)

func _on_mouse_entered(index):
	# Kui hiir siseneb, muudame tekstuuri hover_texture-ks
	print("Mouse entered on sprite: ", index)
	sprites[index].texture = hover_textures[index]

func _on_mouse_exited(index):
	# Kui hiir lahkub, muudame tekstuuri tagasi default_texture-ks
	print("Mouse exited from sprite: ", index)
	sprites[index].texture = default_textures[index]
