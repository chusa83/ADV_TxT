tool
extends Label

export var puntaje = -1 setget _set_score
var puntajeTexto = "Verso: "
var verso = "Todo canto nuevo/nEs la conquista de otros cantos."


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	_set_score(puntaje)
	pass

func _set_score(newScore):
	if puntaje != -1:
		puntajeTexto = str(puntajeTexto + verso[newScore])
	text = puntajeTexto

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
