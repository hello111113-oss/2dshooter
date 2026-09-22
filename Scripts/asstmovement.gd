extends Sprite2D

var sprite_pos: Vector2
var mouse_control_active := true

var a=1

func _ready():
	sprite_pos = position
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action_pressed("ui_cancel") and a % 2 == 0:
		mouse_control_active = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		a += 1
	elif event.is_action_pressed("ui_cancel"):
		mouse_control_active = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		a += 1
	if mouse_control_active and event is InputEventMouseMotion:
		sprite_pos += event.relative
		position = sprite_pos

func _process(_delta):
	if mouse_control_active:
		var center = get_viewport_rect().size / 2.0
