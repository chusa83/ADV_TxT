extends "res://Weightless.gd"
var numPedazos = [9,9,8,7,8,4,7,9]
var pedazos ={}

signal explode

enum Meteoro {
	UNO, DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO
}

export(Meteoro) var meteoro = Meteoro.UNO

var radius

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	radius = (get_node("Estrofa").texture.get_width() /2) * get_node("Estrofa").scale
	#For para declarar los múltiples pedazos
	for each in numpedazos:
		for i in range (1, numpedazos[each]):
			pedazos = {"name" : each, "trozo": i, path: str("res://assets/Asteroides/Pedazos/Meteoro"+each+"-"+i+".tscn")}
		
	
	pass


func _explode():
	var asteroid
	match meteoro:
		UNO:
			asteroid = Pedazo11.instance()
		DOS:
			
		TRES:
			
		CUATRO:
			
		CINCO:
			
		SEIS:
			
		SIETE:
			
		OCHO:
			
	queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
