class_name Player
extends KinematicBody

export(bool) var current_player = true
export(Color) var color = Color.white

signal switch_character

var velocity = Vector3.ZERO
var gravity = -30
var speed = 10

onready var camera = $Pivot/Camera
onready var raycast = $Pivot/RayCast
onready var textbox = $TextBackground/Textbox

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var material = SpatialMaterial.new()
	material.albedo_color = color
	$MeshInstance.set_surface_material(0, material)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += gravity * delta
	
	if current_player:
		var vel = get_direction() * speed
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
			
			elif raycast.is_colliding():
				if raycast.get_collider().is_in_group("interactable"):
					textbox.visible = true

		if event.is_action_pressed("jump") && is_on_floor():
			velocity.y = 15
		
		if event.is_action_pressed("switch_character"):
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
