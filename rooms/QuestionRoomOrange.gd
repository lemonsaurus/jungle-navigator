"""
A room with three possible outcomes:
- You are attacked, and lose 45hp
- You find 40 gold
- Nothing really happens, just triggers some dialogue.
"""

extends Node

signal treasure_room_top
signal skull_room_bottom


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	var outcome = randi() % 3
	
	match outcome:
		0:
			print("THE FIRST OUTCOME")
		1:
			print("THE SECOND OUTCOME")
		2:
			print("THE THIRD OUTCOME")
