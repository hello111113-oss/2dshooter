extends CharacterBody2D

@export var speed: float = 10000
@export var edge_slowdown: float = 0.9

var speed2: int = 5000

var direction: float
var mouse_control_active := true
var mouse_motion := Vector2.ZERO
var a = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _input(event):
	if mouse_control_active and event is InputEventMouseMotion:
		mouse_motion = event.relative
#	if event.is_action_pressed("ui_cancel"):
#		if a == 0:
#			mouse_control_active = false
#			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#			a = 1
#		else:
#			mouse_control_active = true
#			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#			a = 0

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("right", "left")
	velocity.x = direction * speed * _delta
	move_and_slide()

	if mouse_control_active:
		var distance_from_anchor = global_position.distance_to(Global.fpos)
		var slowdown_distance = 500.0
		var normalized_distance = distance_from_anchor / slowdown_distance
		var speed_multiplier = 1.0 - normalized_distance * edge_slowdown
		speed_multiplier = clamp(speed_multiplier, 0.15, 1.0)
		velocity = mouse_motion * speed * speed_multiplier * _delta
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	mouse_motion = Vector2.ZERO
