extends Node

signal intro_room


func _ready():
	emit_signal("intro_room")
