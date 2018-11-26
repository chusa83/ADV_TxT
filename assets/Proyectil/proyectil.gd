extends RigidBody2D
 
onready var viewport = get_viewport().get_visible_rect().size
onready var lifetime = 1.5

func _ready():
	set_max_contacts_reported(1)
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
	### Código de colisión con los meteoros
	var contacts = state.get_contact_count()
	for i in range(contacts):
		var contact = state.get_contact_collider_object(i)
		if contact and contact.get_script().has_script_signal("explode"):
			contact.emit_signal("explode")
			queue_free()
			sleeping = true

func _process(delta):
	lifetime -= delta
	if lifetime <= 0 :
		queue_free()
		sleeping = true