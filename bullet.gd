extends Area2D

var speed = 1000

func _ready():
	set_as_top_level(true)

func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is CharacterBody2D and area.has_method("take_damage"):
		# Emit the "hit" signal
		emit_signal("hit") 
		# area.take_damage() 
		queue_free()
