extends RigidBody2D
 
onready var viewport = get_viewport().get_visible_rect().size
onready var lifetime = 3.0

func _ready():
	pass

func _integrate_forces(state):
	var size = $Sprite.texture.get_size() * $Sprite.scale
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

func _process(delta):
	lifetime -= delta
	if lifetime <= 0 :
		queue_free()