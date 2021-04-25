extends Node

signal question_room_orange


func _on_room_start():
	"""Called when this room is entered"""
	var intro = Dialogic.start("intro.json")
	add_child(intro)
	intro.connect("dialogic_signal", self, '_on_start_game')


func _on_start_game(value):
	"""Runs when the intro dialogue is over"""
	# Randomize the internal state of the RNG.
	randomize()
	
	# Reset all player attributes, in case this is a retry.
	
	# Make dungeon room indicator visible, and wait a few seconds
	
	# Emit the signal to start the next room
	emit_signal("question_room_orange")
	