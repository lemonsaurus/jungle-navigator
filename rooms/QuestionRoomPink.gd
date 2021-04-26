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

var visited = false
var has_golden_avacado = false
var dialog
onready var player = $"../../Player"

signal hurt_player (hurt_value)
signal pay_player (pay_value)



func _on_room_start():
	"""Called when this room is entered"""
	# Move character on map
	emit_signal("navigate", get_position())
	yield(get_tree().create_timer(1.5), "timeout")

	if visited:
		dialog = Dialogic.start("question_room_pink_choice.json")

	elif has_golden_avacado:
		dialog = Dialogic.start("question_room_pink_survive.json")

	elif not has_golden_avacado:
		dialog = Dialogic.start("question_room_pink_dead.json")

	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	visited = true


func _handle_dialogic_event(signal_):
	"""Handle a signal created by Dialogic"""
	if signal_ == "hurt":
		emit_signal("hurt_player", player.health)
	elif signal_ == "gold":
		emit_signal("pay_player", 100)
	else:
		emit_signal(signal_)


func _on_inventory_updated(inventory):
	if "golden_avacado" in inventory:
		has_golden_avacado = true
