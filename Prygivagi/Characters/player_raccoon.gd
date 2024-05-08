extends CharacterBody2D

@export var move_speed: float = 400

@export var inventory: Inventory

func _physics_process(_delta):

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
		var target_direction = Vector2(-input_direction.y, input_direction.x) #Pööra -90 kraadi
		look_at(global_position + target_direction)
	else:
		self.velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

	move_and_slide()
	
func play_action_animation():
	print("test")
	$AnimatedSprite2D.play("action")


#Peaks toimima kui üles võtmise tuvastus, et lisada seljakotti asi
func on_pickup_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)

func on_item_picked_up():
	print("I got a ", inventory)

func collect(item):
	inventory.insert(item)
