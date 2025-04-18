extends CanvasLayer

@onready var character := $Character as Sprite2D
@onready var icon := $FeedbackIcon as Sprite2D
@onready var bubble := $SpeechBubble as TextureRect
@onready var text_label := $SpeechBubble/Label as Label
@onready var reset_timer = $ResetTimer as Timer

var default_texture : Texture2D
var positive_texture : Texture2D
var negative_texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	default_texture = preload("res://Assets/Character/Pesukaru FRONT.png")
	positive_texture = preload("res://Assets/Character/Pesukaru FRONT-pos.png")
	negative_texture = preload("res://Assets/Character/Pesukaru FRONT-neg.png")
	#Et alguses oleks default visuaal
	reset()

func show_positive_feedback():
	character.texture = positive_texture
	bubble.visible = true
	text_label.text = "TUBLI!"
	reset_timer.start()

func show_negative_feedback():
	character.texture = negative_texture
	bubble.visible = true
	text_label.text = "SAAD UUESTI PROOVIDA!"
	reset_timer.start()

func show_feedback_icon_at_position(position: Vector2, is_positive: bool):
	icon.texture = preload("res://Assets/Sorting_level/ÕIGE.png") if is_positive else preload("res://Assets/Sorting_level/VALE.png")
	icon.global_position = position
	icon.visible = true

func reset():
	character.texture = default_texture
	icon.visible = false
	bubble.visible = false


func _on_reset_timer_timeout():
	reset()
