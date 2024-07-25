extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$House/VBoxContainer/DadsHealthBar.value = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




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
