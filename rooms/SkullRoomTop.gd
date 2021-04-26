"""
This room always deals 50hp of damage.
"""
extends Position2D

signal navigate
signal temple_room
signal game_over_room


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
