extends Node

enum STATE {LOADING,LOADED,RESET}

var level =["level1.scn"]
var current_level = 0
onready var level_scene = preload("res://tilesets/levels/Tutorial.tscn")

func _ready():
	var l = level_scene.instance()
	l.set_name("current_level")
	add_child(l)
	print("loaded scene")
	pass

func change(param1):
	var l
	if(param1!=null):
		current_level = param1
	else:
		current_level = current_level+1

	level_scene = load(level[current_level])
	l = level_scene.instance()
	l.set_name("current_level")
	add_child(l)
	print(l+" loaded")
	pass