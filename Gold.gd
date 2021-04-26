extends Label

signal gold (value)


func update_gold(val: int):
	var new_val = int(self.text) + val

	$Tween.interpolate_method(
		self, "_update",
		int(self.text), new_val, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Tween.start()

	emit_signal("gold", new_val)

func _update(text: int):
	self.set_text(str(text))
