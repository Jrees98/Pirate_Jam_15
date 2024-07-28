extends Area2D

var backpackI_cost := 50
var backpackII_cost := 200
var backpackIII_cost := 500
var backpackIBought : bool
var backpackIIBought : bool
var backpackIIIBought : bool

var bootsI_cost := 50
var bootsII_cost := 150
var bootsIII_cost := 300
var bootsIBought : bool
var bootsIIBought : bool
var bootsIIIBought : bool

var pickaxeI_cost := 100
var pickaxeII_cost := 500
var pickaxeIII_cost := 1000
var pickaxeIBought : bool
var pickaxeIIBought : bool

var lantern_cost := 500
var minecart_cost := 1000
var mirror_cost := 250
var cure_cost := 25

signal stop_timer_dad
signal win_game
signal lantern_bought
func _ready():
	backpackIBought = false
	backpackIIBought = false
	backpackIIIBought = false
	$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Cure"
	$CanvasLayer/Panel/Backpack1/BackpackPrice.text = str(cure_cost)
	$CanvasLayer/Panel/Boots/BootsPrice.text = str(bootsI_cost) + "g"
	$CanvasLayer/Panel/Pickaxe/PickaxePrice.text = str(pickaxeI_cost) + "g"
	$CanvasLayer/Panel/Lantern/LanternPrice.text = str(lantern_cost) + "g"
	$CanvasLayer/Panel/Mirror/MirrorPrice.text = str(mirror_cost) + "g"
	$CanvasLayer/Panel/Minecart/MinecartPrice.text = str(minecart_cost) + "g"
	
func _on_body_entered(body):
	$CanvasLayer.show()


func _on_body_exited(body):
	$CanvasLayer.hide()


################## BACKPACK BUTTON START######################
func _on_backpack_1_mouse_entered():
	$CanvasLayer/Panel/Backpack1/ButtonSprite/Border1.show()


func _on_backpack_1_mouse_exited():
	$CanvasLayer/Panel/Backpack1/ButtonSprite/Border1.hide()


func _on_backpack_1_pressed():
	if Global.total_opals >= cure_cost:
		win_game.emit()
		print("You Win!!!!!")

################## BACKPACK BUTTON END ######################


################## BOOTS BUTTON START ######################
func _on_boots_mouse_entered():
	$CanvasLayer/Panel/Boots/ButtonSprite/Border1.show()

func _on_boots_mouse_exited():
	$CanvasLayer/Panel/Boots/ButtonSprite/Border1.hide()

func _on_boots_pressed():
	if bootsIIBought:
		if Global.total_coins >= bootsIII_cost:
			Global.move_speed = 1000
			$CanvasLayer/Panel/Boots.queue_free()
			Global.total_coins = Global.total_coins - bootsIII_cost
			$ItemsUI/Panel/Boots/Label.text = "III"
	elif bootsIBought:
		if Global.total_coins >= bootsII_cost:
			Global.move_speed = 700
			Global.total_coins = Global.total_coins - bootsII_cost
			$CanvasLayer/Panel/Boots/BootsLabel.text = "Boots III"
			bootsIIBought = true
			$CanvasLayer/Panel/Boots/BootsPrice.text = str(bootsIII_cost) + "g"
			$ItemsUI/Panel/Boots/Label.text = "II"
	else:
		if Global.total_coins >= bootsI_cost:
			Global.move_speed = 425
			Global.total_coins = Global.total_coins - bootsI_cost
			$CanvasLayer/Panel/Boots/BootsLabel.text = "Boots II"
			$CanvasLayer/Panel/Boots/BootsPrice.text = str(bootsII_cost) + "g"
			bootsIBought = true
			$ItemsUI/Panel/Boots.show()

################## BOOTS BUTTON END ######################


################## PICKAXE BUTTON START ######################
func _on_pickaxe_mouse_entered():
	$CanvasLayer/Panel/Pickaxe/ButtonSprite/Border1.show()
func _on_pickaxe_mouse_exited():
	$CanvasLayer/Panel/Pickaxe/ButtonSprite/Border1.hide()
func _on_pickaxe_pressed():
	if pickaxeIIBought:
		if Global.total_coins >= pickaxeIII_cost:
			Global.total_coins = Global.total_coins - pickaxeIII_cost
			$CanvasLayer/Panel/Pickaxe.queue_free()
			$ItemsUI/Panel/Pickaxe/Label.text = "III"
			Global.mine_time = 0.1
	elif pickaxeIBought:
		if Global.total_coins >= pickaxeII_cost:
			Global.total_coins = Global.total_coins - pickaxeII_cost
			$ItemsUI/Panel/Pickaxe/Label.text = "II"
			$CanvasLayer/Panel/Pickaxe/PickaxeLabel.text = "Pickaxe III"
			pickaxeIIBought = true
			Global.mine_time = 0.25
			$CanvasLayer/Panel/Pickaxe/PickaxePrice.text = str(pickaxeIII_cost) + "g"
	else:
		if Global.total_coins >= pickaxeI_cost:
			Global.total_coins = Global.total_coins - pickaxeI_cost
			$ItemsUI/Panel/Pickaxe.show()
			Global.mine_time = 0.5
			$CanvasLayer/Panel/Pickaxe/PickaxeLabel.text = "Pickaxe II"
			$CanvasLayer/Panel/Pickaxe/PickaxePrice.text = str(pickaxeII_cost) + "g"
			pickaxeIBought = true




################## PICKAXE BUTTON END ######################


################## LANTERN BUTTON START ######################
func _on_lantern_mouse_entered():
	$CanvasLayer/Panel/Lantern/ButtonSprite/Border1.show()


func _on_lantern_mouse_exited():
	$CanvasLayer/Panel/Lantern/ButtonSprite/Border1.hide()

signal lantern_purchased
func _on_lantern_pressed():
	if Global.total_coins >= lantern_cost:
		Global.total_coins = Global.total_coins - lantern_cost
		$CanvasLayer/Panel/Lantern.queue_free()
		lantern_purchased.emit()




################## LANTERN BUTTON END ######################

################## MINECART BUTTON START ######################

func _on_minecart_mouse_entered():
	$CanvasLayer/Panel/Minecart/ButtonSprite/Border1.show()


func _on_minecart_mouse_exited():
	$CanvasLayer/Panel/Minecart/ButtonSprite/Border1.hide()


func _on_minecart_pressed():
	if Global.total_coins >= minecart_cost:
		Global.total_coins = Global.total_coins - minecart_cost
		$CanvasLayer/Panel/Minecart.queue_free()
		Global.purchased_minecart = true
		Global.move_speed = 3000
	
################## MINECART BUTTON END ######################



################## MIRROR BUTTON START ######################
func _on_mirror_mouse_entered():
	$CanvasLayer/Panel/Mirror/ButtonSprite/Border1.show()


func _on_mirror_mouse_exited():
	$CanvasLayer/Panel/Mirror/ButtonSprite/Border1.hide()


func _on_mirror_pressed():
	if Global.total_coins >= mirror_cost:
		Global.total_coins = Global.total_coins - mirror_cost
		$CanvasLayer/Panel/Mirror.queue_free()
		$ItemsUI/ProgressBar.show()
		$ItemsUI/ProgressBar.value = Global.dads_health
		$ItemsUI/ProgressBar/Timer.start()
		stop_timer_dad.emit()
		$ItemsUI/ProgressBar.show()
		$ItemsUI/Dadsbar.show()
	

func _on_timer_timeout():
	$ItemsUI/ProgressBar.value -= 1
################## MIRROR BUTTON END ######################



