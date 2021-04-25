extends Node

signal dead
var health = 100
var gold = 0


func _on_hurt_player(hurt_value):
	health -= hurt_value
	
	if health <= 0:
		emit_signal("dead")


func _on_pay_player(pay_value):
	gold += pay_value


func _on_reset_player():
	health = 100
	gold = 0
