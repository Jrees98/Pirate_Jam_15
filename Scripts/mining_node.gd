extends Node2D

var player_scene = preload("res://Scenes/player.tscn")
var player_instance
var can_mine = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Instantiate the player once and add it to the scene
	player_instance = player_scene.instantiate()
	add_child(player_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_mine and Input.is_action_pressed("interact"):
		mine()

# Called when the body enters the area
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		can_mine = true
		var rock_node_ui = player_instance.get_node("RockNodeUI")
		var label = rock_node_ui.get_node("InteractLabel")
		label.show()

# Called when the body exits the area
func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		can_mine = false
		var rock_node_ui = player_instance.get_node("RockNodeUI")
		var label = rock_node_ui.get_node("InteractLabel")
		label.hide()
		$AnimatedSprite2D.stop()
		$MiningCoolDown.stop()
		


func mine():
	$AnimatedSprite2D.play("rock_hit")
	$MiningCoolDown.start()



func _on_mining_cool_down_timeout():
		var rock_node_ui = player_instance.get_node("RockNodeUI")
		var label = rock_node_ui.get_node("CoalQuantity")
		var coal_count = Global.total_coal
		Global.total_coal += 1
		
