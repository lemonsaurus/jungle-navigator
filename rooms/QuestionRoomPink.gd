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


func _on_room_start(origin: String):
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position(), true, origin)
	yield(get_tree().create_timer(1.5), "timeout")


func _visit_pink():
	"""Called if the user tries to visit the pink room for the first time."""
	# TODO: Implement


func _dont_visit_pink(origin: String):
	"""Called if the user tries to revisit the pink room."""
	if origin == "skull":
		pass
	elif origin == "treasure":
		pass
	# TODO: Implement
