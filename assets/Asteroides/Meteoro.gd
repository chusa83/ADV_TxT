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

	queue_free()
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
