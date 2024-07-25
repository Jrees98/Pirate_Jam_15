extends Node2D

var player_scene = preload("res://Scenes/player.tscn")
var player_instance
var can_mine = false
var root
var interact_label 
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root.get_child(1)
	interact_label = root.get_node("Player/RockNodeUI/InteractLabel")
	$MiningCoolDown.wait_time = Global.mine_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_mine and Input.is_action_pressed("interact"):
		mine()
	$MiningCoolDown.wait_time = Global.mine_time

# Called when the body enters the area
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		interact_label.show()
		can_mine = true
		

# Called when the body exits the area
func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		interact_label.hide()
		can_mine = false
		$AnimatedSprite2D.stop()
		$MiningCoolDown.stop()
		


func mine():
	$AnimatedSprite2D.play("rock_hit")
	$MiningCoolDown.start()

func _on_mining_cool_down_timeout():
		gem_chance()
		coal_chance()

func coal_chance():
	var number = rng.randi_range(1,Global.coal_chance)
	if number == 1:
		Global.total_coal +=1
	
func gem_chance():
	var number = rng.randi_range(1,Global.blue_gem_chance)
	var greenNumber = rng.randi_range(1, 50)
	var purpleNumber = rng.randi_range(1,100)
	var redNumber = rng.randi_range(1,200)
	var whiteNumber = rng.randi_range(1,500)
	
	
	if number == 1:
		Global.total_gems +=1
	if greenNumber == 1:
		Global.total_greengem += 1
	if purpleNumber == 1:
		Global.total_purplegem += 1
	if redNumber == 1:
		Global.total_redgem += 1
	if whiteNumber == 1:
		Global.total_whitegem += 1
