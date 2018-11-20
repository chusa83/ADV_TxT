extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var cantidadMeteoros = 3
# dificultaf = tiempo + velocidadMeteoro
#export(String) scene_To_Load

func _ready():
	#Metodo para lograr cargar vectores de velocidades aleatoreos en
	#cada uno de los meteoros
	for i in range(1,cantidadMeteoros):
		var meteoro = get_node(str("Meteoro",i))
		#get_node("Meteoro8").set_linear_velocity()
		var vel = Vector2(0,0)
		randomize()
		vel.x = rand_range(-50,50)
		randomize()
		vel.y = rand_range(-50,50)
		meteoro.set_linear_velocity(vel)
		
	#$SceneTreeTimer.connect("timeout", self, "_destroy_meteoro")
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
