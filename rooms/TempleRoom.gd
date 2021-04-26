"""
The win room! You did it!
"""
extends Position2D

signal navigate


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")
	
	get_tree().change_scene("res://win.tscn")
