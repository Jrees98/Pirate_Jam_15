extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_wagon_wagon_entered():
	Global.total_coins = Global.total_coins + (Global.total_coal * Global.coal_price) + (Global.total_gems * Global.gem_price)
	
	Global.total_coal = 0
	Global.total_gems = 0
