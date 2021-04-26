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
	
	emit_signal("pay_player", 80)

	var dialog = Dialogic.start("treasure_room_top.json")
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')

func _handle_dialogic_event(next_room):
	"""Handle a signal created by Dialogic"""
    if next_room == "question_room_pink":
		emit_signal(next_room, "treasure")
	else:
		emit_signal(next_room)
