extends Resource
class_name ItemData


@export var name: String = "Add name..."
@export var description: String = "Add description..."
@export var model_scene: PackedScene = preload("res://item/model/placeholder_item_model.tscn")

var tag: int 
