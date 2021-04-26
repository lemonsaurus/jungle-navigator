"""
Grants 30 gold and gives you The Golden Avacado.
"""
extends Position2D

signal update_inventory (item)
signal pay_player (gold)
signal navigate
signal question_room_green
signal question_room_pink
signal skull_room_top

var visited = false
var dialog


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")
	
	if not visited:
		# Pay the player and add the Golden Avacado to inventory.
		emit_signal("pay_player", 30)
		emit_signal("update_inventory", "golden_avacado")
		dialog = Dialogic.start("treasure_room_bottom.json")
	else:
		# We've already paid the player, so we're not doing it again.
		dialog = Dialogic.start("treasure_room_bottom_choice.json")
		
	# Trigger the dialogue.
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	visited = true


func _handle_dialogic_event(next_room):
	"""Handle a signal created by Dialogic"""
	emit_signal(next_room)
