extends Node

signal start_game


func _ready():
	"""This runs when the game starts up."""
	var intro = Dialogic.start("intro.json")
	add_child(intro)
	intro.connect("dialogic_signal", self, '_on_start_game')


func _on_start_game(value):
	"""Runs when the intro dialogue is over"""
	# Make dungeon room indicator visible, and wait a few seconds
	
	
	# Now move the indicator to the next room.
	print("Hi mom! " + value)
	
	# Now we trigger the dialogue for the first room.
	pass
	
