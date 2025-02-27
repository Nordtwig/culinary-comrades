extends StaticBody3D

@export var item_data: ItemData


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	add_child(item_data.model_scene.instantiate())


func _on_mouse_entered() -> void:
	print("hovering over " + item_data.name)
