extends Node

class_name CharacterStats

signal health_changed(new_health)
signal health_depleted()

var modifiers = {}

var health : int
var mana : int
var max_health : int setget set_max_health
var max_mana : int setget set_max_mana

func initialize(stats : StartingStats):
	max_health = stats.max_health
	max_mana = stats.max_mana
	health = max_health
	mana = max_mana


func set_max_health(value):
	max_health = max(0,value)

func set_max_mana(value):
	max_mana = max(0,value)

