extends Area2D
signal hit
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var last_non_zero_velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	elif Input.is_action_pressed("left"):
		velocity.x -= 1

	if Input.is_action_pressed("down"):
		velocity.y += 1
	elif Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "idle"
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	# Calculate the angle of movement
	var angle = atan2(velocity.y, velocity.x)

	# Set rotation based on the angle of movement with a +90 degree offset
	$AnimatedSprite2D.rotation_degrees = rad_to_deg(angle) + 90
	
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://Scenes/pause_menu.tscn")
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	

