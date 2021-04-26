"""
The room you go to when you die.
"""

extends Position2D


func _on_room_start():
	"""Called when this room is entered"""
	# Play the death sequence
	get_tree().change_scene("res://death.tscn")
