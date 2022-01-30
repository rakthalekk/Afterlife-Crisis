extends StaticBody

export(String) var interact_text = "This must be the murder weapon...You don’t even remember what it felt like to die."

onready var main = $".."

func _ready():
	add_to_group("interactable")


func get_dialog():
	$KnifeDelete.start()
	return interact_text


func _on_KnifeDelete_timeout():
	main.weapon_found = true
	queue_free()
