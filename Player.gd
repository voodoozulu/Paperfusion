extends KinematicBody

const SPEED = 12
const GRAVITY = 1
const JUMP_POWER = 30
const MAX_FALL_SPEED = 30

#refrence to vertical velocity
var y_velo = 0

#camera look sensitivity
const H_LOOK_SENS = 1.0
const V_LOOK_SENS = 1.0
onready var cam = $CamBase
onready var anim = $Sprite3D

func _ready():
	anim.play("idle")
	#this code makes the mouse invisible
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#func _input(event):
#	if event is InputEventMouseMotion:
#		cam.rotation_degrees.x -= event.relative.y * V_LOOK_SENS
#		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
#		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
#
#movement event
func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forward"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backward"):
		move_vec.z += 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		anim.flip_h = true
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
		anim.flip_h = false
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_vec *= SPEED
	move_vec.y = y_velo
	move_and_slide(move_vec, Vector3(0, 1, 0))
	
	#flags to check if youre on the floor
	var grounded = is_on_floor()
	y_velo -= GRAVITY
	var just_jumped = false
	if grounded and Input.is_action_just_pressed("jump"):
		just_jumped = true
		y_velo = JUMP_POWER
	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
		
	if just_jumped:
		anim.play("jump")
	elif grounded:
		if move_vec.x == 0 and move_vec.z == 0:
			anim.play("idle")
		else:
			anim.play("walk")

func play_anim(name):
#	if anim.current_animation == name:
	return
#	anim.play(name)
