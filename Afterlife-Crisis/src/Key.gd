class_name Key
extends StaticBody

export(String) var interact_text = "You feel confused about why there's a key up here. Maybe it will be useful later. You pick it up."

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	$KeyDelete.start()
	return interact_text


func _on_KeyDelete_timeout():
	main.has_key = true
	queue_free()
	
