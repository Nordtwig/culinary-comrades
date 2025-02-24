extends CharacterBody3D
class_name Player


@export var move_speed: float = 5.0


func _ready() -> void:
	print("player spawned")


func _physics_process(delta: float) -> void:
	velocity = Vector3(Input.get_axis("move_left", "move_right"), 0, Input.get_axis("move_forward", "move_backward")).normalized() * move_speed
	move_and_slide()
