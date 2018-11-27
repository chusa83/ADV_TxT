extends "res://Weightless.gd"
var numPedazos = [9,9,8,7,8,4,7,9]
var pedazos ={}

signal explode

enum Meteoro {
	UNO, DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO
}
const CONFIG = {
	Meteoro.UNO: [1, 9],
	Meteoro.DOS: [2, 9],
	Meteoro.TRES: [3, 8],
	Meteoro.CUATRO: [4, 7]
}

export(Meteoro) var meteoro = Meteoro.UNO
export(float) var explode_force = 100

var radius

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	radius = (get_node("Estrofa").texture.get_height() /2) * get_node("Estrofa").scale
	pass


func _explode():

	var config = CONFIG[meteoro]
	for i in range(1, config[1] + 1):
		var offset_dir = PI * 2 / 3 * i
		var resource = "Meteoro"+str(config[0])+"-"+str(i)+".tscn"
		var pedazo = load("res://assets/Asteroides/Pedazos/" + resource).instance()
		print(pedazo)
		pedazo.position = position + radius.rotated(offset_dir)
		pedazo.linear_velocity = linear_velocity + Vector2(explode_force, 0).rotated(offset_dir)
		get_parent().add_child(pedazo)
	queue_free()
	sleeping = true
	pass
