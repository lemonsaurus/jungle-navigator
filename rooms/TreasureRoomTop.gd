"""
Gives you 80 gold and a funny hat.
"""
extends Position2D

signal navigate
signal question_room_green
signal question_room_pink


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
