extends Node


func _handle(name):
	var tween
	var node
	
	for _node in self.get_children():
		if _node.name == name:
			node = _node
			tween = _node.get_children()[0]
			break
	
	if node.modulate == Color(1, 1, 1, 1):
		tween.interpolate_property(
			node, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.5,
			tween.TRANS_SINE, tween.EASE_IN
		)
		tween.start()
