"""
A room that instantly kills you, 
unless you the Golden Avacado.

If you have that, you can sell it for 100 gold.
"""

extends Node

signal treasure_room_top
signal question_room_green
signal game_over_room


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	pass
