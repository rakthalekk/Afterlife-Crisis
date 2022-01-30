extends Control


var text = ""
var char_percent = 0
var chars_written = 0

onready var textbox = $Textbox
onready var player_image = $PlayerImage

# Called when the node enters the scene tree for the first time.
func _ready():
	textbox.text = text


func on_update_text(text):
	chars_written = 0
	self.text = text
	textbox.percent_visible = 0
	textbox.text = text
	char_percent = 1.0 / text.length()
	$TextProcess.start()


func finish_text():
	if text.length() >= 90:
		textbox.text = text.substr(0, 90)
		chars_written = 90
		$ContinueBox.start(0.8)
	textbox.percent_visible = 1


func _on_TextProcess_timeout():
	if textbox.percent_visible != 1:
		if chars_written >= 90 && text[chars_written - 1] == ' ':
			$ContinueBox.start(0.4)
			return
		
		textbox.percent_visible += char_percent
		$TextProcess.start(0.04)
		chars_written += 1
	else:
		#chars_written = 0
		$TextProcess.wait_time = 0.2


func _on_ContinueBox_timeout():
	on_update_text(text.substr(chars_written, text.length()))
