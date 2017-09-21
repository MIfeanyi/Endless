extends Node2D

onready var anim = get_node("anim")
onready var label = get_node("label")
func _ready():
	print(self.get_path())
	pass

func display(param1):
	get_node("Label").set_text(param1)
	get_node("anim").play("Fade in")
	pass
func done():
	if !anim.is_playing():
		return true
	return false
	pass