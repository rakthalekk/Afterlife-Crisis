extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var line1 = "Hello, welcome to limbo."
var line2 = "You were recently killed, and you may be able to go to the afterlife."
var line3 = "In order to get there, however, you must uncover how it is you died, and who killed you."
var line4 = "When you died, your consciousness was split in two."
var line5 = "You'll need to cooperate with your other self to figure out how you died."
var line6 = "You can see from the perspective of your other self using the TAB key."
var line7 = "You have a special power, you can accelerate by pressing the SHIFT key."
var line7b = "You have a special power, you can shrink yourself by pressing the CTRL key."
var line8 = "Go take a look around your old house. You'll find the clues you need. Good luck!"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


func _on_Timer_timeout():
	$Timer1.start()
	update_text(line1)


func update_text(text):
	$UI.on_update_text(text)
	$UI2.on_update_text(text)


func _on_Timer1_timeout():
	update_text(line2)
	$Timer2.start()


func _on_Timer2_timeout():
	update_text(line3)
	$Timer3.start()


func _on_Timer3_timeout():
	update_text(line4)
	$Timer4.start()


func _on_Timer4_timeout():
	update_text(line5)
	$Timer5.start()


func _on_Timer5_timeout():
	update_text(line6)
	$Timer6.start()


func _on_Timer6_timeout():
	$UI.on_update_text(line7)
	$UI2.on_update_text(line7b)
	$Timer7.start()


func _on_Timer7_timeout():
	update_text(line8)
	$Timer8.start()


func _on_Timer8_timeout():
	get_tree().change_scene("res://src/Main.tscn")
