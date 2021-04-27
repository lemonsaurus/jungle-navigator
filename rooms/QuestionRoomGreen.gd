"""
This room will invert your health situation.

- If you're above 50hp, it cuts your health down to 45hp.
- If you're below 50hp, it'll heal you to above 70hp.
"""
extends Position2D

signal navigate
signal treasure_room_bottom
signal skull_room_top
signal hurt_player (hurt_value)
signal heal_player (heal_value)

signal unhide (room)

onready var player = $"../../Player"
var dialog
var visited = false


func _on_room_start():
	"""Called when this room is entered"""
	emit_signal("unhide", "BTR")
	emit_signal("unhide", "SkullT")
	
	# Move character on map
	emit_signal("navigate", get_position())  
	yield(get_tree().create_timer(1.5), "timeout")
	
	# Decide what to do based on health.
	if visited:
		dialog = Dialogic.start("question_room_green_choice.json")
	elif player.health > 50:
		dialog = Dialogic.start("question_room_green_hurt.json")
	elif player.health <= 50:
		dialog = Dialogic.start("question_room_green_heal.json")
		
	# Start the dialog!
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	visited = true


func _handle_dialogic_event(signal_):
	"""Handle a signal created by Dialogic"""
	if signal_ == "hurt":
		emit_signal("hurt_player", player.health - 45)
	elif signal_ == "heal":
		emit_signal("heal_player", 55 - player.health)
	else:
		# Navigate to next room
		emit_signal(signal_)

