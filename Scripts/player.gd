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
	print(direction)
	
	if direction > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	
	if Input.is_action_pressed("minecart"):
		if in_minecart == false:
			$AnimatedSprite2D.play("minecart")
			in_minecart = true
	

	
	#update UI counts
	$RockNodeUI/HBoxContainer/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	
	speed = Global.move_speed
	
	
