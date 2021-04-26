"""
Grants 30 gold and gives you The Golden Avacado.
"""
extends Position2D

signal navigate
signal question_room_green
signal question_room_pink
signal skull_room_top


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
