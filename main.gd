extends Node

signal intro_room
signal health_change (new_value)


func _ready():
	emit_signal("intro_room")
	emit_signal("health_change", 100, false)
