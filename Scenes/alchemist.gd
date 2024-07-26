extends Area2D

var slot_1_full : bool
var slot_2_full : bool
var slot_3_full : bool
var all_slots_full : bool

var slot_1_gem : String
var slot_2_gem : String
var slot_3_gem : String
var combination : String

var potion_recipes = {
	"Strength Potion": "Diamond Emerald Ruby",
	"Mining Potion": "Diamond Ruby Sapphire",
	"Luck Potion": "Amethyst Diamond Ruby",
	"Insanity Potion": "Emerald Ruby Sapphire"
}


func _ready():
	slot_1_full = false
	slot_2_full = false
	slot_3_full = false

func _process(delta):
	if slot_1_full and slot_2_full and slot_3_full:
		all_slots_full = true

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
	if all_slots_full:
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
	if all_slots_full:
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
	if all_slots_full:
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
	if all_slots_full:
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
	if all_slots_full:
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



func _on_combine_button_pressed():
	combination = slot_1_gem + " " + slot_2_gem + " " + slot_3_gem
	var gems_array = combination.split(" ")
	gems_array.sort()
	
	var sorted_gems_array = []
	for gem in gems_array:
		sorted_gems_array.append(gem)
	
	var sorted_gems = str(" ").join(sorted_gems_array)
	
	print(sorted_gems)
	print(potion_recipes["Strength Potion"])
	for key in potion_recipes.keys():
		if potion_recipes[key] == sorted_gems:
			print(key)
		
	



