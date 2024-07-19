extends Node
var total_coal : int
var total_gems : int
var total_coins : int

var blue_gem_chance
var coal_chance

var gem_price : int
var coal_price : int

# Called when the node enters the scene tree for the first time.
func _ready():
	blue_gem_chance = 5
	coal_chance = 1
	
	gem_price = 5
	coal_price = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
