tool
extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	var i = randi()%4
	match int(i):
		1:
			get_node("haroldoDoCampos").get_canvas_item().visibility.visible = true
			get_node("neruda").get_canvas_item().visibility.visible = false
			get_node("symborska").get_canvas_item().visibility.visible = false
			get_node("meiradelmar").get_canvas_item().visibility.visible = false
		2:
			get_node("haroldoDoCampos").get_canvas_item().visibility.visible = false
			get_node("neruda").get_canvas_item().visibility.visible = true
			get_node("symborska").get_canvas_item().visibility.visible = false
			get_node("meiradelmar").get_canvas_item().visibility.visible = false
		3:
			get_node("haroldoDoCampos").get_canvas_item().visibility.visible = false
			get_node("neruda").get_canvas_item().visibility.visible = false
			get_node("symborska").get_canvas_item().visibility.visible = true
			get_node("meiradelmar").get_canvas_item().visibility.visible = false
		4:
			get_node("haroldoDoCampos").get_canvas_item().visibility.visible = false
			get_node("neruda").get_canvas_item().visibility.visible = false
			get_node("symborska").get_canvas_item().visibility.visible = false
			get_node("meiradelmar").get_canvas_item().visibility.visible = true
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
