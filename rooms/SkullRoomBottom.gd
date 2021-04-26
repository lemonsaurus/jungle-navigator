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
onready var player = $"../../Player"


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")

	if player.health <= 55:
		dialog = Dialogic.start("skull_room_bottom_death.json")
	else:
		dialog = Dialogic.start("skull_room_bottom.json")
		
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	
	if self.dead:
		pass  # GAME OVER


func _handle_dialogic_event(signal_):
	"""Handle a signal created by Dialogic"""
	if signal_ == "hurt":
		emit_signal("hurt_player", 55)
	else:
		emit_signal(signal_)


func _on_dead():
	self.dead = true
