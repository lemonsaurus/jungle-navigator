"""
A room that instantly kills you, 
unless you the Golden Avacado.

If you have that, you can sell it for 100 gold.
"""

extends Position2D

signal navigate
signal treasure_room_top
signal question_room_green
signal game_over_room


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
