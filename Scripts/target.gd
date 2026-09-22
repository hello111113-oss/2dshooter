extends Area2D

var direction = Vector2.LEFT
var speed = 10


func _process(_delta: float) -> void:
	if global_position.x <= -5000:
		queue_free()
	if has_overlapping_areas():
		queue_free()
	position += direction * speed
	speed = randi_range(10, 30)
