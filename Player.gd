extends Node

signal inventory_updated (inventory)
signal health_updated (new_health)
signal gold_updated (new_gold)

var health = 100
var gold = 0
var inventory = []


func _on_hurt_player(hurt_value):
	self.health -= hurt_value
	self.health = clamp(self.health, 0, 100)
	
	emit_signal("health_updated", self.health)
		

func _on_heal_player(heal_value):
	self.health += heal_value
	self.health = clamp(self.health, 0, 100)
	
	emit_signal("health_updated", self.health)


func _on_pay_player(pay_value):
	gold += pay_value
	emit_signal("gold_updated", gold)


func _on_room_enter(position: Vector2):
	var tween = $Tween
	tween.interpolate_property(
		$Map_character, "position",
		$Map_character.position, position,
		0.75, Tween.TRANS_QUAD, Tween.EASE_IN_OUT
	)
	tween.start()


func _on_update_inventory(item):
	inventory.append(item)
	emit_signal("inventory_updated", inventory)
