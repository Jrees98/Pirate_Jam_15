extends Area2D

var backpackI_cost := 50
var backpackII_cost := 200
var backpackIII_cost := 500
var backpackIBought : bool
var backpackIIBought : bool
var backpackIIIBought : bool

var bootsI_cost := 50
var bootsII_cost := 200
var bootsIII_cost := 500
var bootsIBought : bool
var bootsIIBought : bool
var bootsIIIBought : bool


func _ready():
	backpackIBought = false
	backpackIIBought = false
	backpackIIIBought = false
	$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack I"
	
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
	if backpackIIBought:
		if Global.total_coins >= backpackIII_cost:
			Global.total_coins = Global.total_coins - backpackIII_cost
			$CanvasLayer/Panel/Backpack1.queue_free()
			Global.personal_inventory_size = 50
			$ItemsUI/Panel/PersonalBackpack/Label.text = "III"
	elif backpackIBought:
		if Global.total_coins >= backpackII_cost:
			$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack III"
			Global.personal_inventory_size = 30
			Global.total_coins = Global.total_coins - backpackII_cost
			backpackIIBought = true
			$CanvasLayer/Panel/Backpack1/BackpackPrice.text = str(backpackIII_cost) + "g"
			$ItemsUI/Panel/PersonalBackpack/Label.text = "II"
	else:
		if Global.total_coins >= backpackI_cost:
			$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack II"
			Global.personal_inventory_size = 10
			Global.total_coins = Global.total_coins - backpackI_cost
			backpackIBought = true
			$CanvasLayer/Panel/Backpack1/BackpackPrice.text = str(backpackII_cost) + "g"
			$ItemsUI/Panel/PersonalBackpack.show()

################## BACKPACK BUTTON END ######################


################## BOOTS BUTTON START ######################
func _on_boots_mouse_entered():
	$CanvasLayer/Panel/Boots/ButtonSprite/Border1.show()

func _on_boots_mouse_exited():
	$CanvasLayer/Panel/Boots/ButtonSprite/Border1.hide()

func _on_boots_pressed():
	if bootsIIBought:
		if Global.total_coins >= bootsIII_cost:
			Global.move_speed = 1500
			$CanvasLayer/Panel/Boots.queue_free()
			Global.total_coins = Global.total_coins - bootsIII_cost
			$ItemsUI/Panel/Boots/Label.text = "III"
	elif bootsIBought:
		if Global.total_coins >= bootsII_cost:
			Global.move_speed = 800
			Global.total_coins = Global.total_coins - bootsII_cost
			$CanvasLayer/Panel/Boots/BootsLabel.text = "Boots III"
			bootsIIBought = true
			$CanvasLayer/Panel/Boots/BootsPrice.text = str(bootsIII_cost) + "g"
			$ItemsUI/Panel/Boots/Label.text = "II"
	else:
		if Global.total_coins >= bootsI_cost:
			Global.move_speed = 500
			Global.total_coins = Global.total_coins - bootsI_cost
			$CanvasLayer/Panel/Boots/BootsLabel.text = "Boots II"
			$CanvasLayer/Panel/Boots/BootsPrice.text = str(bootsII_cost) + "g"
			bootsIBought = true
			$ItemsUI/Panel/Boots.show()

################## BOOTS BUTTON END ######################





################## PICKAXE BUTTON START ######################


################## PICKAXE BUTTON END ######################






