extends Control


var murderer_found = false
var weapon_found = false
var has_key = false
var has_book = false
var has_shoe = false
var win = false

onready var player1 = $HBoxContainer/ViewportContainer/Viewport/Player
onready var player2 = $HBoxContainer/ViewportContainer2/Viewport/Player2


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScreenBlocker/AnimationPlayer.play("fade_in")
	player1.connect("switch_character", self, "on_switch_character_1")
	player2.connect("switch_character", self, "on_switch_character_2")


func _process(delta):
	if murderer_found && weapon_found && !win:
		win = true
		$WinTimer.start()

func on_switch_character_1():
	player1.current_player = false
	player2.current_player = true


func on_switch_character_2():
	player2.current_player = false
	$PlayerSwitchCooldown.start()


func _on_PlayerSwitchCooldown_timeout():
	player1.current_player = true


func _on_WinTimer_timeout():
	$ScreenBlocker/AnimationPlayer.play("fade_out")


func to_win_screen():
	get_tree().change_scene("res://src/WinScreen.tscn")
