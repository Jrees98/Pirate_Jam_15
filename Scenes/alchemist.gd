extends Area2D

var slot_1_full : bool
var slot_2_full : bool
var slot_3_full : bool
var all_slots_full : bool

func _ready():
	slot_1_full = false
	slot_2_full = false
	slot_3_full = false

func _process(delta):
	if slot_1_full and slot_2_full and slot_3_full:
		all_slots_full = true

func reset_scene():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()

func _on_body_entered(body):
	$CanvasLayer.show()

func _on_body_exited(body):
	$CanvasLayer.hide()
	reset_scene()

### DIAMOND ###

func _on_button_mouse_entered():
	$CanvasLayer/Panel/Background/Gems/Diamond/selector.show()


func _on_button_mouse_exited():
	$CanvasLayer/Panel/Background/Gems/Diamond/selector.hide()


func _on_button_pressed():
	if all_slots_full:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot1/Diamond.show()
		$CanvasLayer/Panel/Background/Gems/Diamond.hide()
		slot_1_full = true
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot2/Diamond.show()
		$CanvasLayer/Panel/Background/Gems/Diamond.hide()
		slot_2_full = true
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot3/Diamond.show()
		$CanvasLayer/Panel/Background/Gems/Diamond.hide()
		slot_3_full = true
	

### EMERALD ###

func _on_emerald_button_mouse_entered():
	$CanvasLayer/Panel/Background/Gems/Emerald/selector2.show()


func _on_emerald_button_mouse_exited():
	$CanvasLayer/Panel/Background/Gems/Emerald/selector2.hide()


func _on_emerald_button_pressed():
	if all_slots_full:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot1/Emerald.show()
		$CanvasLayer/Panel/Background/Gems/Emerald.hide()
		slot_1_full = true
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot2/Emerald.show()
		$CanvasLayer/Panel/Background/Gems/Emerald.hide()
		slot_2_full = true
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot3/Emerald.show()
		$CanvasLayer/Panel/Background/Gems/Emerald.hide()
		slot_3_full = true


### SAPPHIRE ###

func _on_sapphire_button_mouse_entered():
	$CanvasLayer/Panel/Background/Gems/Sapphire/selector3.show()


func _on_sapphire_button_mouse_exited():
	$CanvasLayer/Panel/Background/Gems/Sapphire/selector3.hide()


func _on_sapphire_button_pressed():
	if all_slots_full:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot1/Sapphire.show()
		$CanvasLayer/Panel/Background/Gems/Sapphire.hide()
		slot_1_full = true
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot2/Sapphire.show()
		$CanvasLayer/Panel/Background/Gems/Sapphire.hide()
		slot_2_full = true
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot3/Sapphire.show()
		$CanvasLayer/Panel/Background/Gems/Sapphire.hide()
		slot_3_full = true

### RUBY ###

func _on_ruby_button_mouse_entered():
	$CanvasLayer/Panel/Background/Gems/Ruby/selector4.show()


func _on_ruby_button_mouse_exited():
	$CanvasLayer/Panel/Background/Gems/Ruby/selector4.hide()


func _on_ruby_button_pressed():
	if all_slots_full:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot1/Ruby.show()
		$CanvasLayer/Panel/Background/Gems/Ruby.hide()
		slot_1_full = true
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot2/Ruby.show()
		$CanvasLayer/Panel/Background/Gems/Ruby.hide()
		slot_2_full = true
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot3/Ruby.show()
		$CanvasLayer/Panel/Background/Gems/Ruby.hide()
		slot_3_full = true

### AMETHYST ###

func _on_amethyst_button_mouse_entered():
	$CanvasLayer/Panel/Background/Gems/Amethyst/selector5.show()


func _on_amethyst_button_mouse_exited():
	$CanvasLayer/Panel/Background/Gems/Amethyst/selector5.hide()


func _on_amethyst_button_pressed():
	if all_slots_full:
		return
	if slot_1_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot1/Amethyst.show()
		$CanvasLayer/Panel/Background/Gems/Amethyst.hide()
		slot_1_full = true
	elif slot_2_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot2/Amethyst.show()
		$CanvasLayer/Panel/Background/Gems/Amethyst.hide()
		slot_2_full = true
	elif slot_3_full == false:
		$CanvasLayer/Panel/Background/Slots/Slot3/Amethyst.show()
		$CanvasLayer/Panel/Background/Gems/Amethyst.hide()
		slot_3_full = true


func _on_reset_button_pressed():
	reset_scene()
