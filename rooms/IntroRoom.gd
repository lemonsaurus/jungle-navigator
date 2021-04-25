extends Node

signal question_room_orange


func _ready():
	"""This runs when the game starts up."""
	var intro = Dialogic.start("intro.json")
	add_child(intro)
	intro.connect("dialogic_signal", self, '_on_start_game')


func _on_start_game(value):
	"""Runs when the intro dialogue is over"""
	# Make dungeon room indicator visible, and wait a few seconds
	
	# Emit the signal to start the next room
	emit_signal("question_room_orange")
	
