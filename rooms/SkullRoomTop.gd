"""
This room always deals 50hp of damage.
"""
extends Position2D

signal navigate
signal temple_room
signal game_over_room
signal hurt_player (hurt_value)

onready var player = $"../../Player"
var dialog


func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())
	yield(get_tree().create_timer(1.5), "timeout")

	if player.health < 50:
		dialog = Dialogic.start("skull_room_top_death.json")
	else:
		dialog = Dialogic.start("skull_room_top.json")

	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')


func _handle_dialogic_event(signal_):
	"""Handle a signal created by Dialogic"""
	if signal_ == "hurt":
		emit_signal("hurt_player", 50)
	else:
		emit_signal(signal_)
