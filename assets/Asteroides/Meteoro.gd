extends "res://Weightless.gd"

var Pedazo11 = preload("res://assets/Asteroides/Pedazos/Meteoro1-1.tscn")
var Pedazo12 = preload("res://assets/Asteroides/Pedazos/Meteoro1-2.tscn")
var Pedazo13 = preload("res://assets/Asteroides/Pedazos/Meteoro1-3.tscn")
var Pedazo14 = preload("res://assets/Asteroides/Pedazos/Meteoro1-4.tscn")
var Pedazo15 = preload("res://assets/Asteroides/Pedazos/Meteoro1-5.tscn")
var Pedazo16 = preload("res://assets/Asteroides/Pedazos/Meteoro1-6.tscn")
var Pedazo17 = preload("res://assets/Asteroides/Pedazos/Meteoro1-7.tscn")
var Pedazo18 = preload("res://assets/Asteroides/Pedazos/Meteoro1-8.tscn")
var Pedazo19 = preload("res://assets/Asteroides/Pedazos/Meteoro1-9.tscn")


signal explode

enum Meteoro {
	UNO, DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO
}
const CONFIG = {
	Meteoro.UNO: [1, 9],
	Meteoro.DOS: [2, 9],
	Meteoro.TRES: [3, 8]
}

export(Meteoro) var meteoro = Meteoro.UNO

var radius

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	radius = (get_node("Estrofa").texture.get_width() /2) * get_node("Estrofa").scale
	
	pass


func _explode():
	var config = CONFIG[meteoro]
	for i in range(1, config[1] + 1):
		var resource = "Meteoro"+str(config[0])+"-"+str(i)+".tscn"
		var pedazo = load("res://assets/Asteroides/Pedazos/" + resource).instance()
		print(pedazo)
		get_parent().add_child(pedazo)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
