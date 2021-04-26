extends Position2D

signal question_room_orange
signal navigate
signal reset_player


func _on_room_start():
	"""Called when this room is entered"""
	var intro = Dialogic.start("intro.json")
	add_child(intro)
	intro.connect("dialogic_signal", self, '_on_start_game')


func _on_start_game(value):
	"""Runs when the intro dialogue is over"""
	# Emit the signal to start the next room
	emit_signal("question_room_orange")
