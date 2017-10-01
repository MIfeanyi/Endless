extends Node2D

onready var dialog = preload("res://system/Tutorial.tscn") #preload player.scn

func _ready():
	self.connect("dialog",dialog,"display")
	set_fixed_process(true)
	pass
func _display():
	print("this works")
	pass
	
func _fixed_process(delta):
	pass