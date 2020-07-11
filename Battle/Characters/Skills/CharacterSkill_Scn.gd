extends Node

class_name CharacterSkill

var skill_description : String
var mana_cost : int
var base_damage : int
var bonus_damage : int

func initialize(skill : Skill):
	name = skill.skill_name	
	skill_description  = skill.skill_description
	mana_cost = skill.mana_cost
	base_damage = skill.base_damage
	bonus_damage = skill.bonus_damage

