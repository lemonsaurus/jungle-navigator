extends Node


func _ready():
	var dialog = Dialogic.start("GameOverRoom")
	add_child(dialog)
	dialog.connect("dialogic_signal", self, '_handle_dialogic_event')
	
func _handle_dialogic_event(name):
	"""Handle a signal created by Dialogic"""
	if name == "retry":
		get_tree().change_scene("res://main.tscn")
	else:
		get_tree().quit(0)
