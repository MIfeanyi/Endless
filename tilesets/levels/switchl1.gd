extends KinematicBody2D

func _ready():
	set_fixed_process(true)
	
	pass
func _display():
	print("this works")
	pass

func action():
	print("this works")
	pass
	
func _fixed_process(delta):
	if(is_colliding()):
		var other = get_collider()
		if( other.is_in_group("player")):
			print("player touched you")
			pass
	pass