extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$House/VBoxContainer/DadsHealthBar.value = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.dads_health = $House/VBoxContainer/DadsHealthBar.value




func _on_wagon_wagon_entered():
	Global.total_coins = Global.total_coins + (Global.total_coal * Global.coal_price)
	Global.total_coal = 0

func decrease_dad_health():
	$House/VBoxContainer/DadsHealthBar.value -= 10

func _on_timer_timeout():
	if $House/VBoxContainer/DadsHealthBar.value > 0:
		decrease_dad_health()
	else:
		end_game()
		$House/Timer.stop()

func end_game():
	print("Game Over")
	


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
		Global.total_gems = 1000
		Global.total_greengem = 1000
		Global.total_purplegem = 1000
		Global.total_redgem = 1000
		Global.total_whitegem = 1000
		Global.move_speed = 5000
		Global.total_coins = 100000
