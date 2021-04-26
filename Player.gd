extends Node

signal dead

signal pink_error
signal pink_ok

var health = 100
var gold = 0
var visited_pink = false


func _on_hurt_player(hurt_value):
	health -= hurt_value
	
	if health <= 0:
		emit_signal("dead")


func _on_pay_player(pay_value):
	gold += pay_value


func _on_reset_player():
	health = 100
	gold = 0

func _on_room_enter(position: Vector2, pink: bool = false, origin: String = ""):
	# Prevent the user from doubling back up to the pink room
	if pink:
		if visited_pink:
			emit_signal("pink_error", origin)
			return

		else:
			emit_signal("pink_ok")

		visited_pink = true

	var tween = $Tween
	tween.interpolate_property(
		$Map_character, "position",	
		$Map_character.position, position,
		0.75, Tween.TRANS_QUAD, Tween.EASE_IN_OUT
	)
	tween.start()
