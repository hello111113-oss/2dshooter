extends CharacterBody2D

var direction: float
var speed: int = 250000
var a = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and a == 0: 
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE 
		a = 1 
	elif event.is_action_pressed("ui_cancel"): 
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		a = 0

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("right", "left")
	velocity.x = direction * speed * _delta
	move_and_slide()
