extends CharacterBody2D

var speed : int
var in_minecart : bool
func _ready():
	$RockNodeUI/HBoxContainer/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	speed = Global.move_speed
	in_minecart = false
	
func _physics_process(delta):
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = speed * direction
		$AnimatedSprite2D.play("walk")

	else:
		velocity.x = 0
		$AnimatedSprite2D.play("default")
	move_and_slide()
	
	if direction > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	
	if Input.is_action_pressed("minecart"):
		$AnimatedSprite2D.play("minecart")
		in_minecart = true
		Global.move_speed = 5000
	

	
	#update UI counts
	$RockNodeUI/HBoxContainer/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	$RockNodeUI/HBoxContainer/RedGemSprite2/GemQuantity.text = str(Global.total_redgem)
	$RockNodeUI/HBoxContainer/GreenGemSprite3/GemQuantity.text = str(Global.total_greengem)
	$RockNodeUI/HBoxContainer/PurpleGemSprite4/GemQuantity.text = str(Global.total_purplegem)
	speed = Global.move_speed
	
	
