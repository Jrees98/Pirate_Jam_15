extends CharacterBody2D

var speed : int
var in_minecart : bool
var is_mining = false
func _ready():
	$RockNodeUI/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	speed = Global.move_speed
	in_minecart = false
	$RockNodeUI/ProgressBar.value = 100
	$RockNodeUI/SanityBar.value = 100
	
func _physics_process(delta):
	speed = Global.move_speed
	update_ui()
	if not in_minecart:
		move_player()
		check_mining()
	else:
		move_minecart()
	check_minecart()
	
func move_player():
	var direction = Input.get_axis("move_left","move_right")
	if not is_mining:
		if direction != 0:
			velocity.x = speed * direction
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = direction < 0
		else:
			velocity.x = 0
			$AnimatedSprite2D.play("default")
		move_and_slide()

func check_mining():
	if Input.is_action_just_pressed("interact"):
		is_mining = true
		$AnimatedSprite2D.play("mining")
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		is_mining = false

func check_minecart():
	if Input.is_action_just_pressed("minecart") and Global.purchased_minecart == true:
		$AnimatedSprite2D.play("minecart")
		in_minecart = true


func move_minecart():
	var direction = Input.get_axis("move_left","move_right")
	if direction != 0:
		velocity.x = speed * direction
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = 0
	move_and_slide()

func update_ui():
	#update UI counts
	$RockNodeUI/CoalSprite/CoalQuantity.text = str(Global.total_coal)
	$RockNodeUI/HBoxContainer/BlueGemSprite/GemQuantity.text = str(Global.total_gems)
	$RockNodeUI/Coins.text = "$ " + str(Global.total_coins)
	$RockNodeUI/HBoxContainer/RedGemSprite2/GemQuantity.text = str(Global.total_redgem)
	$RockNodeUI/HBoxContainer/GreenGemSprite3/GemQuantity.text = str(Global.total_greengem)
	$RockNodeUI/HBoxContainer/PurpleGemSprite4/GemQuantity.text = str(Global.total_purplegem)
	$RockNodeUI/HBoxContainer/WhiteGemSprite5/GemQuantity.text = str(Global.total_whitegem)
	$RockNodeUI/HBoxContainer/OpalGemSprite6/OpalGemQuantity.text = str(Global.total_opals)
	
func _on_regain_energy_timeout():
	$RockNodeUI/SanityBar.value += 10



func _on_lose_energy_timeout():
	var current_sanity = $RockNodeUI/SanityBar.value
	$RockNodeUI/SanityBar.value -= Global.sanity_bar_amount
	if current_sanity <= 0:
		$RockNodeUI/ProgressBar.value -= 10

var arrow_done = false
var show_inventory = false
func _on_gems_toggle_button_pressed():
	if arrow_done == false:
		$RockNodeUI/Arrow.queue_free()
	arrow_done = true
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
