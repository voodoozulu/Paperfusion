# Base entity that represents a character or a monster in combat
# Every battler has an AI node so all characters can work as a monster
# or as a computer-controlled player ally

extends Position3D

class_name Battler

signal died(battler)

export var TARGET_OFFSET_DISTANCE : float = 120 #unimplemented

const DEFAULT_CHANCE = 0.75 #?

export var stats: Resource
onready var drops := $Drops
onready var skin = $Skin
onready var actions = $Actions
onready var bars = $Bars
onready var skills = $Skills
onready var ai = $AI

var target_global_position : Vector3
var display_name: String

#possibly uneccesary
var selected : bool = false setget set_selected
var selectable : bool = false setget set_selectable

export var party_member = false #possibly uneccesarry. No plans for allies
#export var turn_order_icon: Texture #Remove this feature turns will be static

func _ready() -> void:
	var direction: Vector2 = Vector2(-1.0, 0.0) if party_member else Vector2(1.0, 0.0)
	target_global_position = $TargetAnchor.global_position + direction * TARGET_OFFSET_DISTANCE
	selectable = true

func initialize():
	skin.initialize()
	actions.initialize(skills.get_children())
	stats = stats.copy()
	stats.connect("health_depleted", self, "_on_health_depleted")

func is_able_to_play() -> bool:
	# Returns true if the battler can perform an action
	return stats.health > 0


func set_selected(value): 
	#TODO: add functionality to change UI when we get local UI
	selected = value
	#skin.blink = value #will blink selected character. Possibly unwanted


func set_selectable(value):
	#TODO add greyscaling of dead allies?
	selectable = value
	if not selectable:
		set_selected(false)


func take_damage(hit):  #see how this is controlled. 
	stats.take_damage(hit)
	# prevent playing both stagger and death animation if health <= 0
	if stats.health > 0:
		skin.play_stagger()


func _on_health_depleted():
	selectable = false
	yield(skin.play_death(), "completed")
	emit_signal("died", self)

func appear(): 
	#TODO set up for our battle system. Most of this will be unneeded
	var offset_direction = 1.0 if party_member else -1.0
	skin.position.x += TARGET_OFFSET_DISTANCE * offset_direction
	skin.appear()

func has_point(point: Vector2):
	#No idea what this is for. Look into this in skins and what calls it.
	return skin.battler_anim.extents.has_point(point)





