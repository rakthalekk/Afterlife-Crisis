extends StaticBody

export(String) var interact_text = "It's locked. You remember you used to need a key to get in, and wonder where it could be."

var open = false

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	if main.has_key && !open:
		$AnimationPlayer.play("door_open")
		interact_text = "The door is open, and you can see what's in the closet."
		open = true
		return "The key fits perfectly, and you can finally see what lies behind this door."
	return interact_text
