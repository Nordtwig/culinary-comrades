extends StaticBody3D

@export var item_data: ItemData


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)


func _on_mouse_entered() -> void:
	print("hovering over " + item_data.name)
