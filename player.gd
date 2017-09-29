extends KinematicBody2D

onready var tutorial = get_node("UI/Tutorial")
enum Direction {RIGHT, LEFT}
enum STATUS {IDLE, STANDING, RUNNING, ATTACKING}
enum CONTROL {LOCKED, UNLOCKED}
class player:
	var score = 0
	var speed = 100
	var pos = Vector2(0,0)
	var state = IDLE
	var animationPlayer
	var direction = RIGHT
	var control = UNLOCKED
	
var hero = player.new()

func _ready():
	hero.animationPlayer = get_node("anim")
	hero.animationPlayer.play("Idle")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	hero.pos = Vector2(0,0)
	if hero.control == UNLOCKED:
		if Input.is_action_pressed("ui_accept"):
			if(is_colliding()):
				var other = get_collider()
				if( other.is_in_group("tut_char")):
					print("detected")
					get_parent().get_node("Switches/Level 2 Stairs/anim").play("Fade In")
					tutorial.display("decend to begin...")
					hero.control = LOCKED
				elif(other.is_in_group("stairs")):
						#LOAD level 2
					pass
	
		if Input.is_action_pressed("ui_right"):
			hero.pos += Vector2(1,0)
			hero.direction = RIGHT
			hero.state = RUNNING
		if Input.is_action_pressed("ui_left"):
			hero.pos += Vector2(-1,0)
			hero.direction = LEFT
			hero.state = RUNNING
		if Input.is_action_pressed("ui_up"):
			hero.pos +=Vector2(0,-1)
			hero.state = RUNNING
		if Input.is_action_pressed("ui_down"):
			hero.pos +=Vector2(0,1)
			hero.state = RUNNING
	
		if hero.direction == LEFT:
			get_node("img").set_flip_h(true)
		elif hero.direction == RIGHT:
			get_node("img").set_flip_h(false)

	if hero.state == RUNNING:
		if !hero.animationPlayer.is_playing():
			hero.animationPlayer.play("Walk")
			hero.state = IDLE
	else:
		hero.animationPlayer.play("Idle")
	
	if hero.control == LOCKED:
		if tutorial.done():
			hero.control = UNLOCKED
		pass
	move(hero.pos * hero.speed * delta)