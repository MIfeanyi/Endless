extends Node

enum STATE {LOADING,LOADED,RESET}

var level =["level1.scn"]
var current_level = 0
var level_scene

func _ready():
	# lOAD TUTORIAL LEVEL
	# Initialization here
	pass
func _next_level(param1):
	if(param1!=null):
		#load specific level ie. level_sceene = get_node(level[param1]), current_level = param1
		pass
	else:
		#increment ie. current_level
		pass
	pass