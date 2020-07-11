extends Position3D

class_name Battler

export var TARGET_OFFSET_DISTANCE : float = 120 #unimplemented

const DEFAULT_CHANCE = 0.75 #?
export var stats: Resource
onready var skin = $Skin
onready var actions = $Actions
onready var skills = $Job/Skills

var target_global_position : Vector3

var selected : bool = false #setget set_selected
var selectable : bool = false

export var party_member = false

func _ready() -> void:
	var direction : Vector3 = Vector3(-1.0, 0.0, 0.0) if party_member else Vector3(1.0,0,0)
	#target_global_position = $TargetAnchor.global_position + direction * ...
	
	actions.initialize(skills.get_children())
	
	stats.connect("health_depleted", self, "_on_health_depleted")
	self.selectable = true

