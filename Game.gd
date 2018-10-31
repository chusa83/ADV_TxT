extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#Metodo para lograr cargar vectores de velocidades aleatoreos en
	#cada uno de los meteoros
	for i in range(1,8):
		var meteoro = get_node(str("Meteoro",i))
		#get_node("Meteoro8").set_linear_velocity()
		var vel = Vector2(0,0)
		randomize()
		vel.x = rand_range(-50,50)
		randomize()
		vel.y = rand_range(-50,50)
		print(vel)
		meteoro.set_linear_velocity(vel)
		
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
