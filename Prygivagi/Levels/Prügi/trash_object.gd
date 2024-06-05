extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2
var kontroll = false

#var score = 0
var correct_bins = {
	"paber": "papp",
	"pappkast": "papp",
	"arbuus": "bio",
	"banaan": "bio",
	"oun": "bio",
	"raud": "metall",
	"vask": "metall",
	"tass": "klaas",
	"purk": "klaas",
	"riided": "olme",
	"glasses": "olme"
}

@onready var body = $"paber"

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			if is_inside_dropable:
				if correct_bins.has(self.name) and correct_bins[self.name] == body_ref.name:
					Global.skoor += 100
					queue_free() # Eemalda objekt kui see on õigel dropable peal ja hiireklikk vabastatakse
					print("Score: ", Global.skoor)
				else:
					# Vale prügikast, tagasta algpositsioonile
					var tween = get_tree().create_tween()
					tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			else:
				# Mitte prügikasti peal, tagasta algpositsioonile
				var tween = get_tree().create_tween()
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.10, 1.10)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

@warning_ignore("shadowed_variable")
func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		kontroll = true
		is_inside_dropable = true
		body.modulate = Color(Color.ANTIQUE_WHITE, 1.0)
		body_ref = body
		# Trüki konsooli mõlema objekti nimed
		print("Dragged Object:", self.name, " Dropped On:", body.name)

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		kontroll = false
		is_inside_dropable = false
		body.modulate = Color(Color.LIGHT_SLATE_GRAY, 1.0)
