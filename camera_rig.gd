extends Node3D

@export var distance: float = 6.0
@export var height: float = 2.0
@export var sensitivity: float = 0.005

var rotation_x: float = 0.0
var rotation_y: float = 0.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotation_y -= event.relative.x * sensitivity
		rotation_x -= event.relative.y * sensitivity
		rotation_x = clamp(rotation_x, -0.8, 0.8)

func _process(_delta):
	rotation.y = rotation_y
	rotation.x = rotation_x
	$Camera3D.position = Vector3(0, height, distance)
	$Camera3D.look_at(global_position + Vector3(0, height * 0.5, 0), Vector3.UP)
