"""
Gives you 80 gold and a funny hat.
"""
extends Position2D

signal navigate
signal question_room_green
signal question_room_pink

signal pay_player (pay_value)


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")

	var dialog = Dialogic.start("treasure_room_top.json")
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')

func _handle_dialogic_event(name):
	"""Handle a signal created by Dialogic"""
	if name == "gold":
		emit_signal("pay_player", 80)
	elif name == "question_room_pink":
		emit_signal(name, "treasure")
	else:
		emit_signal(name)
