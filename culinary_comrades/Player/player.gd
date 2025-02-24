extends CharacterBody3D
class_name Player


@export var normal_speed: float = 10.0
@export var sprint_speed: float = 20.0
@export var jump_velocity: float = 90.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_sprinting: bool = false
var is_grounded: bool = false


func _ready() -> void:
	print("player spawned")


func _physics_process(delta: float) -> void:
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
