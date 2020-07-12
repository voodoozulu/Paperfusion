extends KinematicBody

const SPEED = 10
const GRAVITY = 1
const JUMP_POWER = 30
const MAX_FALL_SPEED = 30

onready var anim = $Sprite3D

onready var target = $Player

var velocity = Vector3.ZERO
var player = null

func _physics_process(delta):
	var position = get_translation()
	velocity = Vector3.ZERO
	if player:
		velocity = position.direction_to(target.position) * SPEED
	velocity = move_and_slide(velocity)



func _on_PlayerDetect_body_entered(body):
	 player = body

func _on_PlayerDetect_body_exited(body):
	player = null
	
#func _on_PlayerAttack_body_exited(body):
	

#func _on_PlayerAttack_body_entered(body):
	#call the batte scene here
	

#enum states {PATROL, CHASE, ATTACK, DEAD}
#var state = states.PATROL
#var attacks = ["attack1", "attack2"]
#var position = get_translation()
#
#
##for path following
#export (NodePath) var patrol_path
#var patrol_points
#var patrol_index = 0
#
##target for chase
#var player = null
#var velocity = Vector3(SPEED, 0, 0)
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	anim.play("idle")	
#
#
#func _physics_process(delta):
#	choose_action()
#	#changing the x scale flips the sprite and its attack area
#	if velocity.x > 0:
#		anim.scale.x = 1
#	elif velocity.x < 0:
#		anim.scale.x = -1
#
#	#changing to run animation
#	if velocity.length() > 0:
#		anim.play("walk")
#	#back to idle
#	if anim.get_current_node() == "walk" and velocity.length() == 0:
#		anim.play("idle")
#
#	velocity = move_and_slide(velocity)
#
#func choose_action():
#	velocity = Vector3.ZERO
##	var current = anim.get_current_node()
##	if current in attacks:
##		return
##
##	var target
##	match state:
##		states.DEAD:
##				set_physics_process(false)
#
#		states.PATROL:
#			if !patrol_path:
#				return
#			target = patrol_points[patrol_index]
#			if position.distance_to(target) < 1:
#				patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
#				target = patrol_points[patrol_index]
#			velocity = (target - position).normalized() * SPEED
#
#		states.CHASE:
#			target = player.position
#			velocity = (target - position).normalized() * SPEED
#
#		states.ATTACK:
#			target = player.position
#			if target.x > position.x:
#				anim.scale.x = 1
#			elif target.x < position.x:
#				anim.scale.x = -1
#			anim.travel("attack")	


