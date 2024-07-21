extends Area2D

var backpackI_cost := 50
var backpackII_cost := 200
var backpackIII_cost := 500

var backpackIBought : bool
var backpackIIBought : bool
var backpackIIIBought : bool

func _ready():
	backpackIBought = false
	backpackIIBought = false
	backpackIIIBought = false
	$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack I"
	

func _on_backpack_1_mouse_entered():
	$CanvasLayer/Panel/Backpack1/ButtonSprite/Border1.show()


func _on_backpack_1_mouse_exited():
	$CanvasLayer/Panel/Backpack1/ButtonSprite/Border1.hide()


func _on_backpack_1_pressed():
	if backpackIIBought:
		if Global.total_coins >= backpackIII_cost:
			$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack III"
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
			$ItemsUI/Panel/PersonalBackpack/Label.text = "II"

	else:
		if Global.total_coins >= backpackI_cost:
			$CanvasLayer/Panel/Backpack1/BackpackLabel.text = "Backpack II"
			Global.personal_inventory_size = 10
			Global.total_coins = Global.total_coins - backpackI_cost
			backpackIBought = true
			$ItemsUI/Panel/PersonalBackpack.show()



func _on_body_entered(body):
	$CanvasLayer.show()


func _on_body_exited(body):
	$CanvasLayer.hide()
