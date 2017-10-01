extends Node2D

onready var anim = get_node("anim")
onready var label = get_node("Label")
func _ready():
	print(self.get_path())
	pass

func display(param1):
	label.set_text(param1)
	anim.play("Fade in")
	pass
func done():
	if !anim.is_playing():
		return true
	return false
	pass