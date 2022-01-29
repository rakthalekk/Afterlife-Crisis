extends Control


var text = ""
var char_percent = 0

onready var textbox = $Textbox

# Called when the node enters the scene tree for the first time.
func _ready():
	textbox.text = text


func on_update_text(text):
	self.text = text
	textbox.percent_visible = 0
	textbox.text = text
	char_percent = 1.0 / text.length()
	$TextProcess.start()


func _on_TextProcess_timeout():
	if textbox.percent_visible != 1:
		textbox.percent_visible += char_percent
		$TextProcess.start(0.02)
	else:
		$TextProcess.wait_time = 0.2
