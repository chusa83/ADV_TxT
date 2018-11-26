extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#export(String) sceneToLoad

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _on_BtnControles_pressed():
	get_tree().change_scene('res://Controles.tscn')
	pass # replace with function body


func _on_BtnInicio_pressed():
	get_tree().change_scene('res://Game.tscn')
	pass # replace with function body

func _on_BtnCreditos_pressed():
	get_tree().change_scene('res://Credits.tscn')
	pass # replace with function body

