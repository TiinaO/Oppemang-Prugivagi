extends Area2D

@export var itemRes: InventoryItem
@onready var label: Label = $Label
@onready var score_label = $UserInterface/GameUI/Score as Label

var player = null

var player_in_area = false

var label_offset = 80  # Kui kaugele Label asetatakse Collectable-st
var min_distance = 36  # Min kogus, et ei kattuks korjatava esemega

func _ready():
	label.visible = false
	
	#Antakse vastavalt resursi failile texture ja nimi 
	if itemRes and itemRes.texture and itemRes.name:
		$Sprite2D.texture = itemRes.texture
		label.text = itemRes.name

func _on_body_entered(body):
	#Vajalik selle jaoks, et ülesse võetud asi jõuaks inventory'sse
	if body.has_method("collect"):
		player_in_area = true
		player = body
	if body.has_method("on_item_picked_up"):
		body.on_item_picked_up()
	#Kui mängija on jõudnud alasse, siis kuvatakse asja juures nimi
	if body.name == "PlayerRaccoon":
		player_in_area = true
		label.visible = true


func _on_body_exited(body):
	if body.name == "PlayerRaccoon":
		player_in_area = false
		label.visible = false

func _process(_delta):
	
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		#player.collect(itemRes) # See lisab ka asja kotti, kui teha nii seda kui ka Global meetodit, siis 1 = 2
		Global.player_inventory.insert(itemRes) 
		queue_free()
		var game_level = get_node("/root/GameLevel")
		game_level.add_score(100)
			
	var player_node = get_parent()	
	if player_node != null and player_node.name == "PlayerRaccoon":
		player_node.play_action_animation()
		
	if player_in_area and player:
		var direction = (player.global_position - global_position).normalized()
		var opposite_direction = -direction

		# Labeli keskele asetsemine
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

		#Määratud labeli suurus | Aitab pikemate tekstide eseme ligidal kuvamisega
		var label_set_size = Vector2(128, 81) 

		# Positsioneeri label eseme ümber, vastassuunas mängijast
		var base_offset = (label_offset + min_distance)
		var label_pos = global_position + (opposite_direction * base_offset) - label_set_size
		print("label position ", label_pos)

		label.global_position = label_pos

