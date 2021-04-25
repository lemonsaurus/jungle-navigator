extends Node2D

signal start_game


func _ready():
	"""This runs when the game starts up."""
	var intro = Dialogic.start("intro.json")
	add_child(intro)
	intro.connect("dialogic_signal", self, '_on_start_game')


func _on_start_game(value):
	"""Runs when the intro dialogue is over"""
	# Spawn and move the dungeon room indicator
	# to the first room
	print("Hi mom! " + value)
	
	# Now show the dialogue for this room
	pass
	
