tool
extends Label

export var puntaje = -1 setget _set_score
var puntajeTexto = "Verso: "
var verso = "Todo canto nuevo / Es la conquista de otros cantos."


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#connect("punto", self, "_punto")
	_set_score(puntaje)
	pass

func _set_score(puntaje):
	print(puntaje)
	if puntaje != -1 && verso.length():
		puntajeTexto = str(puntajeTexto + verso[puntaje])
	text = puntajeTexto
	pass

func _punto():
	puntaje = puntaje + 1
	_set_score(puntaje)
	pass

