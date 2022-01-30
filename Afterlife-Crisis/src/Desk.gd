extends StaticBody

const BOOKED = preload("res://Voxel Models/Desk(no_missing_book).obj")
const OPEN = preload("res://Voxel Models/Desk(open).obj")

export(String) var interact_text = "Why would the murder weapon be in here?"

var open = false
var book = false

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	if !main.has_book:
		return "This is the desk where you did all your work. The drawer seems to be locked."
	elif !book:
		$MeshInstance.mesh = BOOKED
		book = true
		return "You put the book in the open slot of the desk, and you hear a mechanical sound."
	elif !open:
		$MeshInstance.mesh = OPEN
		open = true
		$"../Knife".visible = true
		$"../Knife/CollisionShape".disabled = false
		return "You open up the drawer, which slides open easily. Your eyes widen at the sight."
	return interact_text


