extends CharacterBody2D

@export var speed := 300

func _ready():
	$RockNodeUI/HBoxContainer/CoalQuantity.text = "X" + str(Global.total_coal)
	var global_position = $".".global_position
	Global.global_player_position = global_position

func _physics_process(delta):
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = speed * direction
	else:
		velocity.x = 0
	move_and_slide()
	
	$RockNodeUI/HBoxContainer/CoalQuantity.text = "X" + str(Global.total_coal)
	
	global_position = $".".global_position
