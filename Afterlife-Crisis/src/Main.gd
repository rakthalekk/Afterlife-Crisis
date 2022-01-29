extends Control


onready var player1 = $HBoxContainer/ViewportContainer/Viewport/Player
onready var player2 = $HBoxContainer/ViewportContainer2/Viewport/Player2


# Called when the node enters the scene tree for the first time.
func _ready():
	player1.connect("switch_character", self, "on_switch_character_1")
	player2.connect("switch_character", self, "on_switch_character_2")


func on_switch_character_1():
	player1.current_player = false
	player2.current_player = true


func on_switch_character_2():
	player2.current_player = false
	$PlayerSwitchCooldown.start()


func _on_PlayerSwitchCooldown_timeout():
	player1.current_player = true
