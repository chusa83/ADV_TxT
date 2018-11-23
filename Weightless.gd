extends RigidBody2D

onready var estrofa = get_node("Estrofa")
onready var viewport = get_viewport().get_visible_rect().size

func _integrate_forces(state):
	if !estrofa: estrofa = get_node("Texto")
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
