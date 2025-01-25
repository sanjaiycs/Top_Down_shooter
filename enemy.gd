extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null
var hit_count = 0
var max_hits = 2

func _physics_process(delta):
	if player_chase:
		position += (player.position - position) / speed

func _ready():
	# Connect signal for bullet collision using a method name (not the script path)
	connect("hit", self._on_hit)  # Assuming a signal named "hit" is emitted by the bullet

func _on_hit():
	hit_count += 1
	if hit_count == max_hits:  # Check for exact number of hits
		queue_free()  # Remove enemy from scene

func _on_dection_area_body_entered(body):
	player = body
	player_chase = true

func _on_dection_area_body_exited(body):
	player = null
	player_chase = false
