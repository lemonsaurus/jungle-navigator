"""
A room with a random event.
"""

extends Position2D

signal navigate
signal treasure_room_top
signal skull_room_bottom
signal hurt_player (hurt_value)
signal pay_player (pay_value)


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("navigate", get_position())  # Move character on map
	
	randomize()
	var outcome = randi() % 3
	var dialog = null
	
	match outcome:
		0:
			# You are attacked and lose 45hp
			emit_signal("hurt_player", 45)
			dialog = Dialogic.start("question_room_orange_fight.json")
			
		1:
			# You find 40 gold, and a Banana Scepter
			emit_signal("pay_player", 40)
			dialog = Dialogic.start("question_room_orange_treasure.json")
			
		2:
			# Triggers harmless expositional dialogue
			dialog = Dialogic.start("question_room_orange_neutral.json")
			
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	
	
func _handle_dialogic_event(next_room):
	"""Handle a signal created by Dialogic"""
	emit_signal(next_room)
