extends CharacterBody2D

var speed : int
var in_minecart : bool
func _ready():
	$RockNodeUI/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	speed = Global.move_speed
	in_minecart = false
	$RockNodeUI/ProgressBar.value = 100
	$RockNodeUI/SanityBar.value = 100
	
func _physics_process(delta):
	var direction = Input.get_axis("move_left","move_right")
	if in_minecart == false:
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
	if in_minecart:
		if direction:
			velocity.x = speed * direction
		else:
			velocity.x = 0
		move_and_slide()
		
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("minecart") and Global.purchased_minecart == true:
		$AnimatedSprite2D.play("minecart")
		in_minecart = true
		Global.move_speed = 3000
	
	

	
	#update UI counts
	$RockNodeUI/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	$RockNodeUI/HBoxContainer/RedGemSprite2/GemQuantity.text = str(Global.total_redgem)
	$RockNodeUI/HBoxContainer/GreenGemSprite3/GemQuantity.text = str(Global.total_greengem)
	$RockNodeUI/HBoxContainer/PurpleGemSprite4/GemQuantity.text = str(Global.total_purplegem)
	$RockNodeUI/HBoxContainer/WhiteGemSprite5/GemQuantity.text = str(Global.total_whitegem)
	$RockNodeUI/HBoxContainer/OpalGemSprite6/OpalGemQuantity.text = str(Global.total_opals)
	speed = Global.move_speed
	
	

func _on_regain_energy_timeout():

	$RockNodeUI/SanityBar.value += 10



func _on_lose_energy_timeout():
	var current_sanity = $RockNodeUI/SanityBar.value
	$RockNodeUI/SanityBar.value -= 5
	if current_sanity <= 0:
		$RockNodeUI/ProgressBar.value -= 10


var show_inventory = false
func _on_gems_toggle_button_pressed():
	if show_inventory == false:
		$RockNodeUI/HBoxContainer.show()
		show_inventory = true
	else:
		$RockNodeUI/HBoxContainer.hide()
		show_inventory = false

signal health_gone
func _on_health_tracker_timeout():
	if $RockNodeUI/ProgressBar.value < 1:
		health_gone.emit()
		$Health_tracker.stop()
