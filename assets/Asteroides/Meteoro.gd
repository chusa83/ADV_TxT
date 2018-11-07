extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var estrofa = get_node("Estrofa")
onready var viewport = get_viewport().get_visible_rect().size

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _integrate_forces(state):
	var size = estrofa.texture.get_size() * estrofa.scale
	var trans = state.get_transform()
	if (trans.origin.x < -size.x/2):
		trans.origin.x += viewport.x + size.x
	elif (trans.origin.x > viewport.x + size.x/2):
		trans.origin.x -= viewport.x + size.x
	elif(trans.origin.y < -size.y/2):
		trans.origin.y += viewport.y + size.y
	elif (trans.origin.y > viewport.y + size.y/2):
		trans.origin.y -= viewport.y + size.y
		
	state.set_transform(trans)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
