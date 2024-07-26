extends Node
var total_coal : int
var total_gems : int
var total_coins : int
var total_greengem : int
var total_purplegem : int
var total_redgem : int
var total_whitegem : int
var total_opals : int

var blue_gem_chance : int
var emerald_chance : int
var sapphire_chance : int
var opal_chance : int
var amethyst_chance : int
var ruby_chance : int
var coal_chance

var luck_potion_active : bool

var gem_price : int
var coal_price : int

var personal_inventory_size : int
var move_speed : int
var mine_time : float

var regen_energy : bool
var purchased_minecart : bool
var dads_health : int
# Called when the node enters the scene tree for the first time.

func _ready():
	blue_gem_chance = 20
	emerald_chance = 20
	amethyst_chance = 20
	ruby_chance = 20
	sapphire_chance = 20
	opal_chance = 200
	coal_chance = 1
	
	gem_price = 5
	coal_price = 2
	
	total_coins = 0
	
	personal_inventory_size = 0
	move_speed = 300
	mine_time = 1
	regen_energy = true
	
	purchased_minecart = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
