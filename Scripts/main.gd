extends Node2D
var current_scene_path: String = "res://Scenes/main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$House/VBoxContainer/DadsHealthBar.value = 600
	Global.blue_gem_chance = 30
	Global.emerald_chance = 30
	Global.amethyst_chance = 30
	Global.ruby_chance = 30
	Global.sapphire_chance = 30
	Global.opal_chance = 50
	Global.coal_chance = 1
	
	Global.sanity_bar_amount = 5
	
	Global.gem_price = 5
	Global.coal_price = 2
	
	Global.total_coins = 0
	
	Global.total_gems = 0
	Global.total_greengem = 0
	Global.total_purplegem = 0
	Global.total_redgem = 0
	Global.total_whitegem = 0
	Global.total_opals = 0
	Global.move_speed = 0
	Global.total_coins = 0
	
	Global.personal_inventory_size = 0
	Global.move_speed = 300
	Global.mine_time = 1
	Global.regen_energy = true
	
	Global.purchased_minecart = false
	print($House/VBoxContainer/DadsHealthBar.value)
	$Tutorial.show()
	get_tree().paused = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.dads_health = $House/VBoxContainer/DadsHealthBar.value




func _on_wagon_wagon_entered():
	Global.total_coins = Global.total_coins + (Global.total_coal * Global.coal_price)
	Global.total_coal = 0

func decrease_dad_health():
	$House/VBoxContainer/DadsHealthBar.value -= 1
	Global.dads_health = $House/VBoxContainer/DadsHealthBar.value

func _on_timer_timeout():
	if $House/VBoxContainer/DadsHealthBar.value > 0:
		decrease_dad_health()
	else:
		end_game()
		$House/Timer.stop()

func end_game():
	print("Game Over")
	$GameOver.show()
	get_tree().paused = true
	


func _on_mining_area_body_entered(body):
	$Player/RockNodeUI/SanityBar/LoseEnergy.start()
	$Player/RockNodeUI/SanityBar/RegainEnergy.stop()



func _on_mining_area_body_exited(body):
	$Player/RockNodeUI/SanityBar/LoseEnergy.stop()
	$Player/RockNodeUI/SanityBar/RegainEnergy.start()


func _on_shop_stop_timer_dad():
	$House/Timer.stop()
	$House/Timer.start()


func _input(event: InputEvent):
	if event.is_action_pressed("god_mode") and OS.is_debug_build():
		Global.total_gems = 100
		Global.total_greengem = 100
		Global.total_purplegem = 100
		Global.total_redgem = 100
		Global.total_whitegem = 100
		Global.move_speed = 3000
		Global.total_coins = 10000
		Global.total_opals = 100

func _on_alchemist_fear_potion_drank():
	$Player/RockNodeUI/SanityBar.value += 50



func _on_alchemist_dad_health_potion():
	$House/VBoxContainer/DadsHealthBar.value += 50
	$Shop/ItemsUI/ProgressBar.value += 50


func _on_alchemist_you_health_potion():
	$Player/RockNodeUI/ProgressBar.value += 50


func _on_player_health_gone():
	end_game()

func _on_play_again_button_pressed():
	get_tree().reload_current_scene()
	print("working")


func _on_shop_lantern_purchased():
	Global.sanity_bar_amount = Global.sanity_bar_amount/2
	$Player/LanternLight.show()


func _on_shop_win_game():
	$GameOver/Label.text = "  You win!"
	$Shop/CanvasLayer.hide()
	$GameOver.show()
	get_tree().paused = true
	


func _on_go_button_pressed():
	$Tutorial.hide()
	get_tree().paused = false
