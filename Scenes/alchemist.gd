extends Area2D

var slot_1_full : bool
var slot_2_full : bool
var slot_3_full : bool
var all_slots_full : bool

var slot_1_gem : String
var slot_2_gem : String
var slot_3_gem : String
var combination : String

var total_health_potions : int
var total_mining_potions : int
var total_luck_potions : int
var total_fear_potions : int

var potion_recipes = {
	"Health Potion": "Diamond Emerald Ruby",
	"Mining Potion": "Diamond Ruby Sapphire",
	"Luck Potion": "Amethyst Diamond Ruby",
	"Fear Potion": "Emerald Ruby Sapphire"
}


func _ready():
	slot_1_full = false
	slot_2_full = false
	slot_3_full = false

func _process(delta):
	if slot_1_full and slot_2_full and slot_3_full:
		all_slots_full = true
	$PotionsUI/LuckPotion/LuckPotionQuantity.text = str(total_luck_potions)
	$PotionsUI/HealthPotion/HealthPotionQuantity.text = str(total_health_potions)

func reload_table():
	$CanvasLayer/Panel/Background/Slot1/Diamond.hide()
	$CanvasLayer/Panel/Background/Slot1/Emerald.hide()
	$CanvasLayer/Panel/Background/Slot1/Sapphire.hide()
	$CanvasLayer/Panel/Background/Slot1/Ruby.hide()
	$CanvasLayer/Panel/Background/Slot1/Amethyst.hide()
	
	$CanvasLayer/Panel/Background/Slot2/Diamond.hide()
	$CanvasLayer/Panel/Background/Slot2/Emerald.hide()
	$CanvasLayer/Panel/Background/Slot2/Sapphire.hide()
	$CanvasLayer/Panel/Background/Slot2/Ruby.hide()
	$CanvasLayer/Panel/Background/Slot2/Amethyst.hide()
	
	$CanvasLayer/Panel/Background/Slot3/Diamond.hide()
	$CanvasLayer/Panel/Background/Slot3/Emerald.hide()
	$CanvasLayer/Panel/Background/Slot3/Sapphire.hide()
	$CanvasLayer/Panel/Background/Slot3/Ruby.hide()
	$CanvasLayer/Panel/Background/Slot3/Amethyst.hide()
	
	$CanvasLayer/Panel/Background/Diamond.show()
	$CanvasLayer/Panel/Background/Emerald.show()
	$CanvasLayer/Panel/Background/Sapphire.show()
	$CanvasLayer/Panel/Background/Ruby.show()
	$CanvasLayer/Panel/Background/Amethyst.show()
	
	slot_1_full = false
	slot_2_full = false
	slot_3_full = false
	all_slots_full = false
	slot_1_gem = ""
	slot_2_gem = ""
	slot_3_gem = ""


func _on_body_entered(body):
	$CanvasLayer.show()

func _on_body_exited(body):
	$CanvasLayer.hide()
	reload_table()

### DIAMOND ###

func _on_button_mouse_entered():
	$CanvasLayer/Panel/Background/Diamond/selector.show()


func _on_button_mouse_exited():
	$CanvasLayer/Panel/Background/Diamond/selector.hide()


func _on_button_pressed():
	if all_slots_full or Global.total_gems < 1:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slot1/Diamond.show()
		$CanvasLayer/Panel/Background/Diamond.hide()
		slot_1_full = true
		slot_1_gem = "Diamond"
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slot2/Diamond.show()
		$CanvasLayer/Panel/Background/Diamond.hide()
		slot_2_full = true
		slot_2_gem = "Diamond"
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slot3/Diamond.show()
		$CanvasLayer/Panel/Background/Diamond.hide()
		slot_3_full = true
		slot_3_gem = "Diamond"
	

### EMERALD ###

func _on_emerald_button_mouse_entered():
	$CanvasLayer/Panel/Background/Emerald/selector2.show()


func _on_emerald_button_mouse_exited():
	$CanvasLayer/Panel/Background/Emerald/selector2.hide()


func _on_emerald_button_pressed():
	if all_slots_full or Global.total_greengem < 1:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slot1/Emerald.show()
		$CanvasLayer/Panel/Background/Emerald.hide()
		slot_1_full = true
		slot_1_gem = "Emerald"
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slot2/Emerald.show()
		$CanvasLayer/Panel/Background/Emerald.hide()
		slot_2_full = true
		slot_2_gem = "Emerald"
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slot3/Emerald.show()
		$CanvasLayer/Panel/Background/Emerald.hide()
		slot_3_full = true
		slot_3_gem = "Emerald"


### SAPPHIRE ###

func _on_sapphire_button_mouse_entered():
	$CanvasLayer/Panel/Background/Sapphire/selector3.show()


func _on_sapphire_button_mouse_exited():
	$CanvasLayer/Panel/Background/Sapphire/selector3.hide()


func _on_sapphire_button_pressed():
	if all_slots_full or Global.total_whitegem < 1:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slot1/Sapphire.show()
		$CanvasLayer/Panel/Background/Sapphire.hide()
		slot_1_full = true
		slot_1_gem = "Sapphire"
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slot2/Sapphire.show()
		$CanvasLayer/Panel/Background/Sapphire.hide()
		slot_2_full = true
		slot_2_gem = "Sapphire"
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slot3/Sapphire.show()
		$CanvasLayer/Panel/Background/Sapphire.hide()
		slot_3_full = true
		slot_3_gem = "Sapphire"

### RUBY ###

func _on_ruby_button_mouse_entered():
	$CanvasLayer/Panel/Background/Ruby/selector4.show()


func _on_ruby_button_mouse_exited():
	$CanvasLayer/Panel/Background/Ruby/selector4.hide()


func _on_ruby_button_pressed():
	if all_slots_full or Global.total_redgem < 1:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slot1/Ruby.show()
		$CanvasLayer/Panel/Background/Ruby.hide()
		slot_1_full = true
		slot_1_gem = "Ruby"
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slot2/Ruby.show()
		$CanvasLayer/Panel/Background/Ruby.hide()
		slot_2_full = true
		slot_2_gem = "Ruby"
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slot3/Ruby.show()
		$CanvasLayer/Panel/Background/Ruby.hide()
		slot_3_full = true
		slot_3_gem = "Ruby"

### AMETHYST ###

func _on_amethyst_button_mouse_entered():
	$CanvasLayer/Panel/Background/Amethyst/selector5.show()


func _on_amethyst_button_mouse_exited():
	$CanvasLayer/Panel/Background/Amethyst/selector5.hide()


func _on_amethyst_button_pressed():
	if all_slots_full or Global.total_purplegem < 1:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slot1/Amethyst.show()
		$CanvasLayer/Panel/Background/Amethyst.hide()
		slot_1_full = true
		slot_1_gem = "Amethyst"
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slot2/Amethyst.show()
		$CanvasLayer/Panel/Background/Amethyst.hide()
		slot_2_full = true
		slot_2_gem = "Amethyst"
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slot3/Amethyst.show()
		$CanvasLayer/Panel/Background/Amethyst.hide()
		slot_3_full = true
		slot_3_gem = "Amethyst"


func _on_reset_button_pressed():
	reload_table()


### COMBINE BUTTON ###
func _on_combine_button_pressed():
	var potion := ""
	combination = slot_1_gem + " " + slot_2_gem + " " + slot_3_gem
	var gems_array = combination.split(" ")
	gems_array.sort()
	
	var sorted_gems_array = []
	for gem in gems_array:
		sorted_gems_array.append(gem)
		if gem == "Diamond":
			Global.total_gems -= 1
		elif gem == "Emerald":
			Global.total_greengem -= 1
		elif gem == "Ruby":
			Global.total_redgem -= 1
		elif gem == "Amethyst":
			Global.total_purplegem -=1
		elif gem == "Sapphire":
			Global.total_whitegem -= 1
	
	var sorted_gems = str(" ").join(sorted_gems_array)
	
	for key in potion_recipes.keys():
		if potion_recipes[key] == sorted_gems:
			potion = key
			print(potion)
			if potion == "Health Potion":
				total_health_potions += 1
				$PotionsUI/HealthPotion/HealthPotionQuantity.text = str(total_health_potions)
			elif potion == "Mining Potion":
				total_mining_potions += 1
				$PotionsUI/MiningPotion/MiningPotionQuantity.text = str(total_mining_potions)
			elif potion == "Luck Potion":
				total_luck_potions += 1
				$PotionsUI/LuckPotion/LuckPotionQuantity.text = str(total_luck_potions)
			elif potion == "Fear Potion":
				total_fear_potions += 1
				$PotionsUI/FearPotion/FearPotionQuantity.text = str(total_fear_potions)
				
			
	reload_table()



### LUCKY POTION

func _on_luck_potion_button_mouse_entered():
	$PotionsUI/LuckPotion/LuckPotionSelector.show()
	$PotionsUI/ToolTip.show()
	$PotionsUI/ToolTip.text = "Luck Potion"

func _on_luck_potion_button_mouse_exited():
	$PotionsUI/LuckPotion/LuckPotionSelector.hide()
	$PotionsUI/ToolTip.show().hide()

var lucky_countdown_timer_value := 30
func _on_luck_potion_button_pressed():
	if total_luck_potions > 0:
		total_luck_potions -= 1
		$PotionsUI/LuckPotion/LuckPotionQuantity.text = str(total_luck_potions)
		Global.luck_potion_active = true
		$PotionsUI/LuckPotion/LuckTimer.start()
		$PotionsBuff/LuckyPotionBuff.show()
		$PotionsBuff/LuckyPotionBuff/LuckyTimer.start()
		lucky_countdown_timer_value = 30
		$PotionsBuff/LuckyPotionBuff/LuckCountDown.text = str(lucky_countdown_timer_value)

func _on_lucky_timer_timeout():
	lucky_countdown_timer_value -= 1
	$PotionsBuff/LuckyPotionBuff/LuckCountDown.text = str(lucky_countdown_timer_value)

func _on_luck_timer_timeout():
	$PotionsUI/LuckPotion/LuckTimer.stop()
	$PotionsBuff/LuckyPotionBuff/LuckyTimer.stop()
	$PotionsBuff/LuckyPotionBuff.hide()
	Global.luck_potion_active = false


#### MINING POTION

func _on_mining_potion_button_mouse_entered():
	$PotionsUI/MiningPotion/MiningPotionSelector.show()
	$PotionsUI/ToolTip.show()
	$PotionsUI/ToolTip.text = "Mining Potion"


func _on_mining_potion_button_mouse_exited():
	$PotionsUI/MiningPotion/MiningPotionSelector.hide()
	$PotionsUI/ToolTip.hide()
var mining_potion_active = false
var mining_timer_value := 15
func _on_mining_potion_button_pressed():
	if total_mining_potions > 0 and not mining_potion_active:
		total_mining_potions -= 1
		$PotionsUI/MiningPotion/MiningPotionQuantity.text = str(total_mining_potions)
		Global.mine_time = Global.mine_time / 5
		$PotionsUI/MiningPotion/MiningBuffTimer.start()
		$PotionsBuff/MiningPotionBuff.show()
		mining_timer_value = 15
		$PotionsBuff/MiningPotionBuff/MiningTimer.start()
		$PotionsBuff/MiningPotionBuff/MiningCountDown.text = str(mining_timer_value)
		mining_potion_active = true



func _on_mining_buff_timer_timeout():
	$PotionsUI/MiningPotion/MiningBuffTimer.stop()
	$PotionsBuff/MiningPotionBuff/MiningTimer.stop()
	Global.mine_time = Global.mine_time * 5
	$PotionsBuff/MiningPotionBuff.hide()
	mining_potion_active = false


func _on_mining_timer_timeout():
	mining_timer_value -= 1
	$PotionsBuff/MiningPotionBuff/MiningCountDown.text = str(mining_timer_value)
	
	
### FEAR POTION

func _on_fear_potion_button_mouse_entered():
	$PotionsUI/FearPotion/FearPotionSelector.show()
	$PotionsUI/ToolTip.show()
	$PotionsUI/ToolTip.text = "Fear Potion"

func _on_fear_potion_button_mouse_exited():
	$PotionsUI/FearPotion/FearPotionSelector.hide()
	$PotionsUI/ToolTip.hide()

signal fear_potion_drank
func _on_fear_potion_button_pressed():
	if total_fear_potions > 0:
		fear_potion_drank.emit()
		total_fear_potions -= 1
		$PotionsUI/FearPotion/FearPotionQuantity.text = str(total_fear_potions)
		

### HEALTH POTION



func _on_health_potion_button_mouse_entered():
	$PotionsUI/HealthPotion/HealthPotionSelector.show()
	$PotionsUI/ToolTip.show()
	$PotionsUI/ToolTip.text = "Health Potion"


func _on_health_potion_button_mouse_exited():
	$PotionsUI/HealthPotion/HealthPotionSelector.hide()
	$PotionsUI/ToolTip.hide()

signal dad_health_potion
signal you_health_potion
func _on_health_potion_button_pressed():
	if total_health_potions > 0:
		$PotionsUI/HealthPotion/UseOnWho.show()


func _on_exitbutton_pressed():
	$PotionsUI/HealthPotion/UseOnWho.hide()


func _on_dad_button_pressed():
	dad_health_potion.emit()
	$PotionsUI/HealthPotion/UseOnWho.hide()
	total_health_potions -= 1


func _on_you_button_pressed():
	you_health_potion.emit()
	$PotionsUI/HealthPotion/UseOnWho.hide()
	total_health_potions -= 1
