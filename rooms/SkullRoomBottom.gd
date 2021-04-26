"""
This room deals 55 hitpoints of damage. Ouch!
"""

extends Position2D

signal navigate
signal question_room_pink
signal treasure_room_bottom
signal game_over_room
signal hurt_player (hurt_value)

var dead
var dialog


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")

	dead = false  # We'll set this back to false, since it might be a retry.
	emit_signal("hurt_player", 55)
	
	if dead:
		emit_signal("game_over_room")
		return
	else:
		dialog = Dialogic.start("skull_room_bottom.json")
		
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')


func _handle_dialogic_event(next_room):
	"""Handle a signal created by Dialogic"""
	if next_room == "question_room_pink":
		emit_signal(next_room, "skull")
	else:
		emit_signal(next_room)


func _on_dead():
	dead = true
