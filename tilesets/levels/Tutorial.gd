extends Node

signal change_level

func _ready():
	var stairs = get_node("stairs")
	var dialog_manager = get_node("Player")
	self.connect("change_level",self,"change")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	pass

func change():
	print("changing level.")
	pass

func _on_Player_on_stairs():
	get_tree().change_scene("res://tilesets/levels/Dungeon2.tscn")
	pass # replace with function body
