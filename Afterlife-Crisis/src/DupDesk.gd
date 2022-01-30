extends StaticBody

const OPEN = preload("res://Voxel Models/Desk(open).obj")

export(String) var interact_text = "There's a small pen in the drawer. Nothing else of note."

var open = false


func _ready():
	add_to_group("interactable")


func get_dialog():
	if !open:
		open = true
		$MeshInstance.mesh = OPEN
		return "The drawer opens with ease."
	return interact_text

