extends CharacterBody3D
class_name Player


@export var normal_speed: float = 6.0
@export var sprint_speed: float = 12.0
@export var jump_velocity: float = 4.0
@export var mouse_sensitivity: float = 0.005

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_sprinting: bool = false
var is_grounded: bool = false

@onready var camera: Camera3D = $Body/Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	print(PI/2)


func _physics_process(delta: float) -> void:
	move()


func _input(event) -> void:
	if event is InputEventMouseMotion:
		look_around(event.relative)


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func  move() -> void:
	if is_on_floor():
		is_sprinting = Input.is_action_pressed("sprint")
	
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity
	
		if not is_grounded:
			is_grounded = true
	
	else:
		velocity.y -= gravity
	
		if is_grounded:
			is_grounded = false
	
	var speed := normal_speed if not is_sprinting else sprint_speed
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	velocity.z = direction.z * speed
	velocity.x = direction.x * speed
	
	move_and_slide()


func look_around(relative:Vector2):
	rotate_y(-relative.x * mouse_sensitivity)
	camera.rotate_x(-relative.y * mouse_sensitivity)
	camera.rotation.x = clampf(camera.rotation.x, -PI/2, PI/2)
