"""
This room will invert your health situation.

- If you're above 50hp, it cuts your health down to 45hp.
- If you're below 50hp, it'll heal you to above 70hp.
"""
extends Position2D

signal navigate
signal treasure_room_bottom
signal skull_room_top


func _ready():
	"""Called when the game starts"""
	pass


func _on_room_start():
	"""Called when this room is entered"""
	# NOTE: Don't allow player to go to TreasureRoomBottom
	#       if they've already been there!
	
	emit_signal("navigate", get_position())  # Move character on map
