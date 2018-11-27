extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
# dificultaf = tiempo + velocidadMeteoro
#export(String) scene_To_Load

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _destroy_meteoro():
	randomize()
	var i = randi()%3
	var meteoro = get_node("Meteoro"+str(i+1))
	meteoro._explode()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
