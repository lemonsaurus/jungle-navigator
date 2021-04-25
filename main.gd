extends Node

signal intro_room


func _ready():
	emit_signal("intro_room")


func _on_room_start():
	pass # Replace with function body.
