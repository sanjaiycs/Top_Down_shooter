extends CharacterBody2D

var movespeed = 500.0
var bullet_scene = load("res://bullet.tscn")  # Load the bullet scene

func _physics_process(delta):
	var motion = Vector2()

	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1

	motion = motion.normalized() * movespeed
	velocity = motion  # Use the existing velocity property
	move_and_slide()

	
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_position = global_position
	bullet_instance.rotation = rotation 
	add_child(bullet_instance)
