extends "res://Weightless.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal explode

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("explode", self, "_explode")
	pass


func _explode():
	emit_signal("punto")
	queue_free()
	sleeping = true
	pass