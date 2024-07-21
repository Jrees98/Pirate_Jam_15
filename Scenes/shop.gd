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

var pickaxeI_cost := 100
var pickaxeII_cost := 500
var pickaxeIII_cost := 1000
var pickaxeIBought : bool
var pickaxeIIBought : bool

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









