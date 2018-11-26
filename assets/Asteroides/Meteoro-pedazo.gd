extends "res://Weightless.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal punto
onready var puntaje = get_node("/root/Game/UI/Label")
signal explode

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	print(puntaje)
	pass


func _explode():
	print("olas")
	#emit_signal("punto")
	puntaje._punto()
	queue_free()
	sleeping = true
	pass