class_name Interactable
extends Node

export(String) var interact_text = "dummy text"


func _ready():
	add_to_group("interactable")


func get_dialog():
	return interact_text
