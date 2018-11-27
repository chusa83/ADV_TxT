extends Node2D

var Meteoro1 = preload("res://assets/Asteroides/Meteoros/Meteoro1.tscn")
var Meteoro2 = preload("res://assets/Asteroides/Meteoros/Meteoro2.tscn")
var Meteoro3 = preload("res://assets/Asteroides/Meteoros/Meteoro3.tscn")
var Meteoro4 = preload("res://assets/Asteroides/Meteoros/Meteoro4.tscn")
var Meteoro5 = preload("res://assets/Asteroides/Meteoros/Meteoro5.tscn")
var Meteoro6 = preload("res://assets/Asteroides/Meteoros/Meteoro6.tscn")
var Meteoro7 = preload("res://assets/Asteroides/Meteoros/Meteoro7.tscn")
var Meteoro8 = preload("res://assets/Asteroides/Meteoros/Meteoro8.tscn")

onready var jugador = get_tree().current_scene.find_node("jugador")

export var level = 0
export var meteorospornivel = 1
export var saferadius = 200
export var maxSpeed = 150
export var minSpeed = 50

func _process(delta):
	if get_child_count() == 0:
		level+= 1
		var avoid = jugador.position
		var viewport = get_viewport().get_visible_rect().size
		for i in range(level*meteorospornivel):
			var child
			match randi()%8:
				0:
					child=Meteoro1.instance()
					child.Meteoro.UNO
				1:
					child=Meteoro2.instance()
					child.Meteoro.DOS
				2:
					child=Meteoro3.instance()
					child.Meteoro.TRES
				3:
					child=Meteoro4.instance()
					child.Meteoro.CUATRO
				4:
					child=Meteoro5.instance()
					child.Meteoro.CINCO
				5:
					child=Meteoro6.instance()
					child.Meteoro.SEIS
				6:
					child=Meteoro7.instance()
					child.Meteoro.SIETE
				7:
					child=Meteoro8.instance()
					child.Meteoro.OCHO
				
			var where = avoid
			while (where-avoid).length()<=saferadius:
				where.x = rand_range(0, viewport.x)
				where.y = rand_range(0, viewport.y)
			child.position = where
			var angle = randf() * PI * 2
			var speed = rand_range(minSpeed, maxSpeed)
			child.linear_velocity = Vector2(speed, 0).rotated(angle)
			add_child(child)
			pass
		pass
	pass
