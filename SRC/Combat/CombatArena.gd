extends Spatial

class_name CombatArena

const BattlerNode = preload("res://src/combat/battlers/Battler.tscn")

onready var turn_queue: TurnQueue = $TurnQueue
onready var interface = $CombatInterface
onready var rewards = $Rewards

var active: bool = false
var party: Array = []
var initial_formation: Formation

# TODO: Refactor and clean up this script
# sent when the battler is starting to end (before battle_completed)
signal battle_ends
# sent when battle is completed, contains status updates for the party
# so that we may persist the data
signal battle_completed
signal victory
signal game_over