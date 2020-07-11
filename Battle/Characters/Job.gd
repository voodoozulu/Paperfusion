tool
extends Node

class_name Job

onready var skills = $Skills

export var starting_stats : Resource

export(Array, String) var starting_skills
export(PackedScene) var character_skills_scene : PackedScene

func _ready():
	if starting_skills != null and starting_skills.size() > 0:
		for skill in starting_skills:
			var new_skill = character_skills_scene.instance()
			new_skill.initialize(skill)
			skills.add_child(new_skill)