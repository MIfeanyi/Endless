extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var animationPlayer
enum Direction {RIGHT, LEFT}
enum STATUS {STANDING, RUNNING, ATTACKING}
var direction = RIGHT

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.play("Idle")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if Input.is_action_pressed("ui_right"):
		direction = RIGHT
		animationPlayer.play("Idle")
	if Input.is_action_pressed("ui_left"):
		direction = LEFT
		animationPlayer.play("Idle")
	if direction == LEFT:
		get_node("Sprite").set_flip_h(true)
	elif direction == RIGHT:
		get_node("Sprite").set_flip_h(false)