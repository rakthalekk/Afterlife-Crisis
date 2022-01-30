extends StaticBody

export(String) var interact_text = "It's a photo of you and your coworker. You didn't know him very well, but he always seemed nice enough."

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	if main.has_shoe:
		main.murderer_found = true
		return "Your coworker...his shoes match the one you found under the bed. But why would he do this to you?"
	return interact_text

