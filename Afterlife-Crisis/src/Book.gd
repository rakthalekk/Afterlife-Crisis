extends StaticBody

export(String) var interact_text = "A book lies alone in the corner of the closet. You pick it up, hoping your efforts were not for nothing."

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	$BookDelete.start()
	return interact_text


func _on_BookDelete_timeout():
	main.has_book = true
	queue_free()
