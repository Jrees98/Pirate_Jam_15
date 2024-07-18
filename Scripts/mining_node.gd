extends Node2D

var player_scene = preload("res://Scenes/player.tscn")
var player_instance
var can_mine = false
var root
var interact_label 
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root
	interact_label = root.get_node("Main/Player/RockNodeUI/InteractLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_mine and Input.is_action_pressed("interact"):
		mine()

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
	print("Coal" + str(number))
	
func gem_chance():
	var number = rng.randi_range(1,Global.gem_chance)
	if number == 1:
		Global.total_gems +=1
	print("Gem" + str(number))
