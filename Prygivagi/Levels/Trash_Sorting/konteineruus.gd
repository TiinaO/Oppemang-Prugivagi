extends CharacterBody2D


# Called when the node enters the scene tree for the first time.

func _ready():
	modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0)

		
func _process(delta):
	if not TrashObject.kontroll:
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("open")
