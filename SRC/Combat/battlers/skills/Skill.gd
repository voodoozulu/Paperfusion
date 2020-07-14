extends Resource

class_name Skill

export var skill_name : String = "Skill"
export var skill_description : String = "Description"
export var icon: Texture = load("res://icon.png")

export var mana_cost : int
export var base_damage : int
export var bonus_damage : int
