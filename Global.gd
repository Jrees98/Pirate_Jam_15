extends Node
var total_coal : int
var total_gems : int
var global_player_position : Vector2
var gem_chance
var coal_chance

# Called when the node enters the scene tree for the first time.
func _ready():
	gem_chance = 10
	coal_chance = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
