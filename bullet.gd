extends Area2D

func _process(_delta: float) -> void:
	if has_overlapping_areas():
		print("Target hit")
		queue_free()
	else:
		await get_tree().create_timer(0.02).timeout
		queue_free()
