extends Node2D

var target_scene: PackedScene = preload("res://Scenes/target.tscn")
var bullets_scene: PackedScene = preload("res://Scenes/bullets.tscn")
var person_scene: PackedScene = preload("res://Scenes/person.tscn")
var FPview_scene: PackedScene = preload("res://Scenes/FPview.tscn")
var person = person_scene.instantiate()
var fpview = FPview_scene.instantiate()
#var targ_count := 0
var bullet_count := 0

func _ready() -> void:
	add_child(person)

# hit right click to aim - release to shoot bullet 
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("right_click") and is_instance_valid(person): 
			Global.fpos = person.position
			add_child(fpview)
			remove_child(person)
			fpview.global_position = person.global_position
	
	elif Input.is_action_just_released("right_click"):
		bullet_count += 1
		var bulletchild = bullets_scene.instantiate() as Area2D
		add_child(bulletchild)
		#var bullet_inner = bulletchild.get_child(0)
		#bullet_inner.name = "bullet" + str(bullet_count)
		bulletchild.global_position = fpview.global_position
		Global.shootcoord = bulletchild.global_position
		remove_child(fpview)
		add_child(person)

func _on_targ_timer_timeout() -> void:
#	targ_count += 1
	var targ = target_scene.instantiate() as Node2D
	add_child(targ)
#	var targ_inner = targ.get_child(0)
#	targ_inner.name = "targ" + str(targ_count)
	var pos_marker = $TargStartpos.get_children().pick_random() as Marker2D
	targ.position = pos_marker.position
