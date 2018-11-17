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

export(Meteoro) var meteoro = Meteoro.UNO

var radius = get_node("Estrofa").texture.get_width() /2 * get_node("Estrofa").scale


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	pass


func _explode():
	
	queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
