extends CharacterBody2D

@export var move_speed: float = 1600 #800
@export var inventory: Inventory

@onready var movementSound: AudioStreamPlayer2D = $AudioStreamPlayer2D

var can_move := true # Popupi ajal liikumise võimekuse määramiseks

func _physics_process(_delta):
	if not can_move:
		return

	# Liikumine
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# Suund
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()
		self.velocity = input_direction * move_speed
		$AnimatedSprite2D.play("move")
		# movementSound.play()
		var target_direction = Vector2(-input_direction.y, input_direction.x) #Pööra -90 kraadi
		look_at(global_position + target_direction)
	else:
		self.velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

	move_and_slide()
	
func play_action_animation():
	print("test")
	$AnimatedSprite2D.play("action")

#Asjade inventorysse lisamine, mis karakter on ülesse võtnud
func collect(item):
	inventory.insert(item)
