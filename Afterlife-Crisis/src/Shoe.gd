extends StaticBody

export(String) var interact_text = "Looks like the culprit hid this shoe under the bed to avoid creating any tracks. It has very distinctly orange laces that seem somehow familiar..."

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	main.has_shoe = true
	return interact_text
