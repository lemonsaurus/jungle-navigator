"""
The room you go to when you die.

Has an option to restart the game,
and a grimacing lemon.
"""

extends Position2D

signal navigate
signal retry


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
	
	# Play the death sequence
	get_tree().change_scene("res://death.tscn")
