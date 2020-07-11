extends Node

class_name TurnQueue

var active_character

func initialize():
	active_character = get_child(0)

func play_turn():
		yield(acive_character.play_turn(), "completed")
		var new_index : int = (active_character.get_index() + 1) % get_child_count()
		