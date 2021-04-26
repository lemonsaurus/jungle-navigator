"""
The win room! You did it!

Displays your total treasure.
"""
extends Position2D

signal navigate
signal retry


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
