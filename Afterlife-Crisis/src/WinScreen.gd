extends Control


var line1 = "Looks like you've pieced it together."
var line2 = "You were murdered by your coworker, and now that you've fully uncovered this mystery, you may proceed to the afterlife."
var line3 = "Why did he murder you, you might ask?"
var line4 = "idk"

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Timer.start()


func _on_Timer_timeout():
	$UI.on_update_text(line1)
	$Timer2.start()


func _on_Timer2_timeout():
	$UI.on_update_text(line2)
	$Timer3.start()


func _on_Timer3_timeout():
	$UI.on_update_text(line3)
	$Timer4.start()


func _on_Timer4_timeout():
	$UI.on_update_text(line4)
	$Timer5.start()


func _on_Timer5_timeout():
	$UI.visible = false
	$"YouWin!".visible = true


func _on_Button_pressed():
	get_tree().change_scene("res://src/TitleScreen.tscn")
