tool
extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	var i = rand_range(1,5)
	print (int(i))
	get_node("haroldoDoCampos").set_visible(false)
	get_node("neruda").set_visible(false)
	get_node("symborska").set_visible(false)
	get_node("meiradelmar").set_visible(false)
			
	match int(i):
		1:
			get_node("haroldoDoCampos").set_visible(true)
			
		2:
			get_node("neruda").set_visible(true)
			
		3:
			get_node("symborska").set_visible(true)
			
		4:
			get_node("meiradelmar").set_visible(true)
			
	get_node("ColorRect/Anim").play("Muerte dafein")
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	var anim_actual = get_node("ColorRect/Anim")
	anim_actual.play("Muerte dafeout")
	yield(anim_actual, "animation_finished")
	#print("cambie de pantalla")
	get_tree().change_scene('res://Inicio.tscn')
	pass # replace with function body
