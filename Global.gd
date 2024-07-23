extends Node
var total_coal : int
var total_gems : int
var total_coins : int
var total_greengem : int
var total_purplegem : int
var total_redgem : int
var total_whitegem : int

var blue_gem_chance
var coal_chance

var gem_price : int
var coal_price : int

var personal_inventory_size : int
var move_speed : int
var mine_time : float
# Called when the node enters the scene tree for the first time.
func _ready():
	blue_gem_chance = 5
	coal_chance = 1
	
	gem_price = 5
	coal_price = 2
	
	total_coins = 10000
	
	personal_inventory_size = 0
	move_speed = 300
	mine_time = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
