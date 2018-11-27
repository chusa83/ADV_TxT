extends KinematicBody2D

export (float) var rotation_speed = 1.5

onready var viewport = get_viewport().get_visible_rect().size

var recarga = 0
var proyectil = preload("res://assets/Proyectil/proyectil.tscn")
var max_limite = 200
var min_limite = 0
var aceleracion = 100
var velocity = Vector2 (0, 0)
var current_velocity = Vector2(0,0) 
var rotation_dir = 0
var lives = 3
var invul = 0
var invul_time = .4

#movimiento
func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 2
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 2
	if Input.is_action_pressed('ui_up'):
		velocity.x = aceleracion*cos(rotation)
		velocity.y = aceleracion*sin(rotation)
	#disparo
	if Input.is_action_pressed('ui_select'):
		if recarga <= 0 :
			var disparo = proyectil.instance()
			disparo.position = position + Vector2(60,0).rotated(rotation)
			disparo.rotation = rotation
			disparo.linear_velocity = Vector2(200,0).rotated(rotation)
			get_parent().add_child(disparo)
			recarga = .3

#universo de rosquilla
func _integrate_forces():
	var size = $jugadorSP.texture.get_size() * $jugadorSP.scale
	var trans = get_transform()
	if (trans.origin.x < -size.x/2):
		trans.origin.x += viewport.x + size.x
	elif (trans.origin.x > viewport.x + size.x/2):
		trans.origin.x -= viewport.x + size.x
	elif(trans.origin.y < -size.y/2):
		trans.origin.y += viewport.y + size.y
	elif (trans.origin.y > viewport.y + size.y/2):
		trans.origin.y -= viewport.y + size.y
		
	set_transform(trans)

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if invul <= 0:
		lives -= 1
		invul = invul_time
		$Timer.start()
		$jugadorSP/AnimationPlayer.play("flash")
		yield($Timer,"timeout")
		$jugadorSP/AnimationPlayer.stop(true)
		

func _physics_process(delta):
	get_input()
	current_velocity += velocity
	var speed = current_velocity.length()
	if speed < min_limite:
		speed = min_limite
	if speed > max_limite:
		speed = max_limite
	current_velocity = current_velocity.normalized()*speed
	rotation += rotation_dir * rotation_speed * delta
	recarga -= delta
	invul -= delta
	move_and_slide(current_velocity)
	_integrate_forces()
	if lives <= 0:
		queue_free()
		get_tree().change_scene("res://Muerte.tscn")