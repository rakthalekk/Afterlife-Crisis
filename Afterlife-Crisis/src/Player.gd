class_name Player
extends KinematicBody

export(Texture) var character_sprite
export(bool) var current_player = true
export(String) var interact_text = "Hello clone brother what is up my guy would you like a drink?"

signal switch_character
signal update_text

var velocity = Vector3.ZERO
var gravity = -30
var speed = 10
var FAKE = false

onready var camera = $Pivot/Camera
onready var raycast = $Pivot/RayCast

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/PlayerImage.texture = character_sprite
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	connect("update_text", $UI, "on_update_text")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += gravity * delta
	
	if current_player:
		var vel = get_direction() * speed
		if Input.is_action_pressed("run") && get_name() == "Player":
			vel *= 2
		
		if Input.is_action_just_pressed("crouch") && get_name() == "Player2":
			$MeshInstance2.visible = true
			$MeshInstance.visible = false
			$CollisionShape2.disabled = false
			$CollisionShape.disabled = true
			$Pivot.translation = Vector3(0, -2, 0)
		
		if Input.is_action_just_released("crouch") && get_name() == "Player2":
			$MeshInstance2.visible = false
			$MeshInstance.visible = true
			$CollisionShape2.disabled = true
			$CollisionShape.disabled = false
			$Pivot.translation = Vector3(0, 2, 0)
		
		velocity.x = vel.x
		velocity.z = vel.z
	velocity = move_and_slide(velocity, Vector3.UP, true)


func _input(event):
	if current_player:
		if event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
		if event.is_action_pressed("click"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
			elif $UI.textbox.percent_visible != 1:
				$UI.finish_text()
			
			elif raycast.is_colliding():
				var col = raycast.get_collider()
#				if col is Player:
#					handle_dialog()
				if col.is_in_group("interactable"):
					emit_signal("update_text", col.get_dialog())

		if event.is_action_pressed("jump") && is_on_floor():
			velocity.y = 18
		
		if event.is_action_pressed("switch_character"):
			velocity.x = 0
			velocity.z = 0
			emit_signal("switch_character")
		
		if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			rotate_y(-event.relative.x * 0.002)
			$Pivot.rotate_x(-event.relative.y * 0.002)
			$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)


func get_direction():
	var direction = Vector3.ZERO
	if Input.is_action_pressed("walk_forward"):
		direction += -global_transform.basis.z
	if Input.is_action_pressed("walk_backward"):
		direction += global_transform.basis.z
	if Input.is_action_pressed("walk_left"):
		direction += -global_transform.basis.x
	if Input.is_action_pressed("walk_right"):
		direction += global_transform.basis.x
	return direction.normalized()


func handle_dialog():
	print(get_name())


func get_dialog():
	return interact_text
