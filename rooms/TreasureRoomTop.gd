"""
Gives you 80 gold and a funny hat.
"""
extends Position2D

signal navigate
signal question_room_green
signal question_room_pink
signal pay_player (pay_value)

signal unhide (room)

var visited = false
var dialog


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("unhide", "PQM")
	emit_signal("unhide", "GQM")
	
	# Move character on map
	emit_signal("navigate", get_position())
	yield(get_tree().create_timer(1.5), "timeout")

	if not visited:
		# Pay the player
		emit_signal("pay_player", 80)

		# Trigger dialogue
		dialog = Dialogic.start("treasure_room_top.json")
	else:
		# Been here before!
		dialog = Dialogic.start("treasure_room_top_choice.json")

	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	visited = true


func _handle_dialogic_event(next_room):
	"""Handle a signal created by Dialogic"""
	emit_signal(next_room)
