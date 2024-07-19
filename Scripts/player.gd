extends CharacterBody2D

@export var speed := 300

func _ready():
	$RockNodeUI/HBoxContainer/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	
func _physics_process(delta):
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = speed * direction
	else:
		velocity.x = 0
	move_and_slide()
	
	#update UI counts
	$RockNodeUI/HBoxContainer/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	
